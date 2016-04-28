#!/bin/bash

#Use custom .vimrc
cd
ln -sf ~/ARstuff/.vimrc .vimrc
echo "STATUS(.vimrc): "
ls -l ~/.vimrc

#Use custom .bash_profile
if grep --quiet 'Call custom profile' ~/.bash_profile
then
	echo "Already contains custom profile entry..."
else
	echo "" >> ~/.bash_profile
	echo "#Call custom profile" >> ~/.bash_profile
	echo "source ~/ARstuff/.bash_profile" >> ~/.bash_profile
fi
echo "STATUS(.bash_profile): "
tail  ~/.bash_profile
