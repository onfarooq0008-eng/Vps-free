#!/bin/bash

service ssh start

ttyd -p 7681 -W -u user -w user bash
