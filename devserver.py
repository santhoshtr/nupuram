import logging
import time
import os
import subprocess
import flask
from flask import send_from_directory
from string import Template
from watchdog.events import FileSystemEventHandler
from watchdog.observers.polling import PollingObserver
from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(message)s',
                    datefmt='%Y-%m-%d %H:%M:%S')

logger = logging.root
fontName = "Seventy"
fontVersion = open('VERSION').readline().strip()

app = flask.Flask(__name__, static_folder="")
events = []
class ConfigChangeHandler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.event_type == 'modified':
            # Event is modified, you can process it now
            logger.info("Configuration modified - % s" % event.src_path)
            process = subprocess.Popen(
                'make glyphs && make ufonormalizer', shell=True)
            process.wait()

class UFOChangeHandler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.event_type == 'modified':
            # Event is modified, you can process it now
            logger.info("UFO modified - % s" % event.src_path)
            process = subprocess.Popen(
                'make clean && make webfonts', shell=True)
            process.wait()
            events.append('{"fontname":"%s", "version":"%s", "build":"%s"}' % (fontName, fontVersion , time.strftime("%Y%m%d%H%M%S")))


class DesignChangeHandler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.event_type == 'created' or event.event_type == 'modified':
            logger.info("Design modified - % s" % event.src_path)
            context = {
                'script': 'tools/import-svg-to-ufo.py',
                'config': 'sources/design/config/Regular.yaml',
                'svg': event.src_path,
            }
            command = Template(
                'python ${script} -c ${config} -i ${svg}').safe_substitute(**context)
            process = subprocess.Popen(command, shell=True)
            process.wait()

static_file_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tests')

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
        self.observer = PollingObserver()

    def run(self):
        PORT = 8000
        self.observer.schedule(ConfigChangeHandler(),
                               './sources/design/config', recursive=True)
        self.observer.schedule(DesignChangeHandler(),
                               './sources/design/Regular', recursive=True)
        self.observer.schedule(UFOChangeHandler(),
                               './sources/Seventy-Regular.ufo', recursive=True)
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


