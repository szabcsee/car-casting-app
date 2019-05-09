#!/bin/bash
# Build the Sencha App and deploy it to the public directory then run the server.

echo "################################################";
echo "#  What would you like to build today?         #";
echo "#                                              #";
echo "#      1) Rails                                #";
echo "#                                              #";
echo "#      2) Run Sencha Watch only                #";
echo "#                                              #";
echo "################################################";
echo "                                                ";
select yn in "1" "2"; do
    case $yn in
        1)
            cd extjs-ui/
            sencha-6.2.1.29 app build
            cd ..
            echo "Move to the public folder.";
            cp -rf extjs-ui/build/production/DharmaCloud/* public/
            echo "Rails taking the stage...";
            rails s
            break;;
        2)
            echo "ExtJs is taking the stage";
            cd extjs-ui/
            sencha-6.2.1.29 app watch
            cd ..
            break;;
    esac
done
