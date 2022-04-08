import logging
import time
import os
import yaml
import subprocess
import flask
from flask import send_from_directory
from string import Template
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer
from munch import DefaultMunch

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')

logger = logging.root
with open("config.yaml") as confg_file:
    config = DefaultMunch.fromDict(
        yaml.load(confg_file, Loader=yaml.FullLoader))
fontName = config.name
fontVersion = config.version
app = flask.Flask(__name__, static_folder="")
events = []


class BuildChangeHandler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.event_type == 'created' or event.event_type == 'modified':
            if 'woff2' in event.src_path:
                # Event is modified, you can process it now
                logger.info("Webfonts modified - % s" % event.src_path)
                events.append('{"fontname":"%s", "version":"%s", "build":"%s"}' % (
                    fontName, fontVersion, time.strftime("%Y%m%d%H%M%S")))


class DesignChangeHandler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.event_type == 'created' or event.event_type == 'modified':
            logger.info("Design modified - % s" % event.src_path)
            context = {
                'script': 'tools/builder.py',
                'format': 'WOFF2',
            }
            command = Template(
                'python ${script} -f ${format}').safe_substitute(**context)
            process = subprocess.Popen(command, shell=True)
            process.wait()


static_file_dir = os.path.join(
    os.path.dirname(os.path.realpath(__file__)), 'tests')


@app.route('/stream')
def stream():
    def eventStream():
        for message in events:
            # wait for source data to be available, then push it
            yield 'data: {}\n\n'.format(message)
            events.pop()
    return flask.Response(eventStream(), mimetype="text/event-stream")


class TypeDevServer:

    def __init__(self) -> None:
        self.observer = Observer()

    def run(self):
        PORT = 8000
        self.observer.schedule(DesignChangeHandler(),
                               './config.yaml')
        self.observer.schedule(BuildChangeHandler(),
                               './fonts', recursive=True)
        self.observer.schedule(DesignChangeHandler(),
                               './sources/design/Regular', recursive=True)

        # Start the observer
        self.observer.start()

        app.run(threaded=True)

        try:
            while True:
                # Set the thread sleep time
                time.sleep(1)
        except KeyboardInterrupt:
            self.observer.stop()
        self.observer.join()


if __name__ == "__main__":
    server = TypeDevServer()
    server.run()
