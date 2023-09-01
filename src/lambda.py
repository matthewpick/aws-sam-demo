
import logging
import os
import sys

import cowsay

from config import environment

logging.basicConfig(stream=sys.stdout, level=logging.INFO)
logging.getLogger().setLevel(logging.INFO)
log = logging.getLogger(__name__)


def handler(event, _):
    env = environment()
    log.info('Received event %s', event)

    cowsay.cow(env.COW_SPEAK)


if __name__ == "__main__":
    os.environ['COW_SPEAK'] = 'Hello local world'
    handler({}, None)
