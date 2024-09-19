import subprocess
import re
from time import sleep

def get_volume_level():
    try:        
        result = subprocess.run(['pactl', 'get-sink-volume', '@DEFAULT_SINK@'],
                                capture_output=True, text=True, check=True)
        output = result.stdout.strip()
        match = re.search(r'(\d+)%', output)
        if match:
            return int(match.group(1))
        else:
            return 0
    except subprocess.CalledProcessError:
        return 0

while True:
    print(f"{get_volume_level()}%", flush=True)
    sleep(0.2)
