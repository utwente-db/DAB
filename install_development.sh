#script for setting up development environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
npm install
npm run build
echo -n "Have you set up the secret.py file? (FIRST PAGE OF README) (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo Good. You may now run start.sh
else
    echo Please set it up before you run start.sh
fi