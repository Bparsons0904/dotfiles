#!/bin/bash
if lspci | grep -i nvidia > /dev/null; then
    echo "source = ~/.config/hypr/nvidia.conf" > ~/.config/hypr/hardware-specific.conf
    export NVIDIA_GPU=1
elif lspci | grep -i amd > /dev/null; then
    echo "source = ~/.config/hypr/amd.conf" > ~/.config/hypr/hardware-specific.conf
    export AMD_GPU=1
fi

if laptop-detect; then
    echo "source = ~/.config/hypr/laptop.conf" >> ~/.config/hypr/hardware-specific.conf
    export LAPTOP=1
fi
