import sys
import subprocess
import os
import signal

lock_file = "/tmp/autoclicker.lock"

def main():
    pid = 000000
    if not os.path.exists(lock_file):
        sys.exit(0)
        return
    # get the process id
    with open(lock_file, "rb") as f:
        pid = int(f.read())
    print("killing process id {pid}")
    os.kill(pid, signal.SIGTERM)
      
    
    if os.path.exists(lock_file):
        os.remove(lock_file)

if __name__ == "__main__":
    main()
