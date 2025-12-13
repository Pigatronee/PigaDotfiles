import time
import subprocess
import os
import sys

time_to_sleep = 0.0001

lock_file = "/tmp/autoclicker.lock"

p = subprocess.Popen(["dotool"], stdin=subprocess.PIPE, text=True)

def click():
    p.stdin.write("click 1\n")
    p.stdin.flush()
    time.sleep(0.01)
def main():
    # check if lock exists
    if os.path.exists(lock_file):
        sys.exit(0)
    with open(lock_file, "w") as f:
        f.write(str(os.getpid()))
    # click logic
    try:
        while True:
            #time.sleep(time_to_sleep)
            click()
    except KeyboardInterrupt:
        print("Ending")
        p.terminate()
    finally:
        if os.path.exists(lock_file):
            os.remove(lock_file)

if __name__ == "__main__":
    main()

