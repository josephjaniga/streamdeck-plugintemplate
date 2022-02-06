#!/bin/bash

execution_working_directory=$(pwd)

# check the existance of the distribution tool
echo "Checking DistributionTool..."
if ! type ./bin/DistributionTool.exe > /dev/null; then
  echo "Downloading the DistributionTool..."
  curl -o ./bin/DistributionTool.zip https://developer.elgato.com/documentation/stream-deck/distributiontool/DistributionToolWindows.zip
  unzip -oqq ./bin/DistributionTool.zip -d ./bin
fi
./bin/DistributionTool.exe --version

needle="com.elgato.template"

#read input
echo "This helper script will set your package name for the project."
read -p "New package name [${needle}]: " packagename
packagename=${packagename:-${needle}}

# copy the template plugin filesystem
cp -r ./Template/Sources/com.elgato.template.sdPlugin "./Sources/${packagename}.sdPlugin"

# search replace all instances of packagename
cd "./Sources/${packagename}.sdPlugin"
echo "Found needle [${needle}] in the following files."
grep -rli $needle --include \*.js --include \*.json --include \*.html
grep -rli $needle --include \*.js --include \*.json --include \*.html | xargs -i@ sed -i "s/${needle}/${packagename}/g" @

# create a build target file to help the build script identify this plugin
cd "${execution_working_directory}"
cp ./Scripts/build.target.template ./Scripts/build.target
sed -i "s/${needle}/${packagename}/g" ./Scripts/build.target