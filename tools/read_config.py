import sys
import yaml

config = yaml.load(open('config.yaml'), Loader=yaml.BaseLoader)

if __name__ == "__main__":
    key = sys.argv[1]
    val = config
    for k in key.split("."):
        val = val[k]
    if isinstance(val, list):
        print(" ".join(val))
    else:
        print(val)
