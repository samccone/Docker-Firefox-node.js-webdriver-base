# export display so firefox knows where to show
# since we are in headless mode
export DISPLAY=:99.0

# start xdisplay
Xvfb :99 -shmem -screen 0 1366x768x16 &

# run the test
node index