import time
import subprocess
import os
import sys

time_to_sleep = 0.01

lock_file = "/tmp/autoclicker.lock"

def click():
    subprocess.run(["dotool"],input="click 1\n",text=True) 

def main():
    # check if lock exists
    if os.path.exists(lock_file):
        sys.exit(0)
    with open(lock_file, "w") as f:
        f.write(str(os.getpid()))
    # click logic
    try:
        while True:
            time.sleep(time_to_sleep)
            click()
    except KeyboardInterrupt:
        print("Ending")
    finally:
        if os.path.exists(lock_file):
            os.remove(lock_file)

if __name__ == "__main__":
    main()

