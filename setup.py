#!/bin/env python3
# coding: utf-8
import os.path
import io
import re

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = io.open(os.path.join(here, 'README.rst'), encoding='utf8').read()
CHANGES = io.open(os.path.join(here, 'CHANGES.txt'), encoding='utf8').read()

with io.open(os.path.join(here, 'freemote', 'freemote'), encoding='utf8') as version_file:
    metadata = dict(re.findall(r"""__([a-z_]+)__\s*=\s*u?"([^"]+)""", version_file.read()))
    
setup(name=metadata['application'],
      version=metadata['version'],
      description=metadata['description'],
      long_description=README + '\n\n' + CHANGES,
      classifiers=[
          "Development Status :: 4 - Beta",
          "Environment :: X11 Applications :: GTK",
          "Intended Audience :: End Users/Desktop",
          "License :: OSI Approved :: MIT License",
          "Natural Language :: English",
          "Natural Language :: French",
          "Operating System :: POSIX :: Linux",
          "Programming Language :: Python :: 3",
          "Topic :: Multimedia",
      ],
      author=metadata['author'],
      author_email=metadata['author_email'],
      url=metadata['url'],
      keywords=['freemote', 'freebox'],
      license='MIT',
      packages=find_packages(),
      python_requires=">=3.0",
      extras_require={
          'revolution': ['remotefreebox'],
          },
      include_package_data=True,
      zip_safe=False,
      scripts = ['freemote/freemote'],
      data_files=[('/usr/local/share/applications',['freemote/freemote.desktop']),
                  ('/usr/local/share/icons',['freemote/resources/freemote.png'])]
      )
