# Mac 源码编译安装vim8.0
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

sudo make VIMRUNTIMEDIR=/usr/share/vim/vim80   

sudo make install 

> * *若sudo make install 报没有权限，那么重启，按住Command+R进入恢复模式，打开终端，csrutil disable；reboot*  
> * *重新登录后，先看看csrutil status试试disabled。若disabled，在执行上面的操作。vim所有步骤完成后记得csrutil enable;reboot哦！！！*

***

##  4. 让VIM作为你的默认编辑器

cd ~/Workspace/openSource/vim/src    

sudo cp vim /usr/local/bin/vim     

sudo cp vim /usr/bin/vim  

> **也可以先which vim 看看可执行vim所在路径*

***

##  5. 查看vim版本

vim --version    
