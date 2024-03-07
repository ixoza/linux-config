#!/bin/bash

apt update && apt upgrade -y

apt install git curl tree wget neofetch htop tldr -y

apt list --installed