#!/bin/bash

service ssh start

ttyd -p 7681 -W bash
