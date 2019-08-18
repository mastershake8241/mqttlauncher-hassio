echo "#!/bin/bash" >> /data/start.sh

echo "/app/setupuser.sh" >> /data/start.sh

echo "su -c "$*" abc" >> /data/start.sh
