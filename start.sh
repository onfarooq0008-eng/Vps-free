#!/bin/bash

service ssh start

ttyd -p 8000 -W bash
