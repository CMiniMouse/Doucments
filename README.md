# Documents
##  1.安装依赖库

brew install libncurses5-dev libgnome2-dev libgnomeui-dev \    

     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \     
	 
     libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \ 
	 
     python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git    

***

##  2.删除已有vim

...

***

##  3. 下载vim源码

mkdir ~/Workspace/openSource  
cd ~/Workspace/openSource  
git clone https://github.com/vim/vim.git  
  
cd vim  

make distclean  

./configure --with-features=huge \\    
            --enable-multibyte \\    
            --enable-rubyinterp=yes \\    
            --enable-pythoninterp=yes \\    
            --with-python-config-dir=/usr/lib/python2.7/config \\    
            --enable-python3interp=yes \\    
            --with-python3-config-dir=/usr/lib/python3.5/config \\    
            --enable-perlinterp=yes \\    
            --enable-luainterp=yes \\    
            --enable-gui=gtk2 --enable-cscope --prefix=/usr    

make VIMRUNTIMEDIR=/usr/share/vim/vim80   

sudo make install 

***

##  4. 让VIM作为你的默认编辑器

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1  
sudo update-alternatives --set editor /usr/bin/vim  
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1  
sudo update-alternatives --set vi /usr/bin/vim   

***

##  5. 查看vim版本

vim --version    
