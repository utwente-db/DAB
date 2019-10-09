When Freek fixes the webpack setup, .sass, .css, .ts files will go here
Webpack will compile them to the [PROJECT ROOT]/frontend directory/

src/ should also hold the templates folder, and a python folder which contains all python stuff
maybe slightly change the naming of the django apps
or maybe just ha

--- how to move things to src: ---
move tests, designapp1, designproject to src folder
change manage.py to have "src.designproject.settings" instead of "designproject.settings"
change settings.py to have "src.designapp1" instead of "designapp1"
done!

^ do this after a merge