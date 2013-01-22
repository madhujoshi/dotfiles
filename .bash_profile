alias ops1='ssh ops1.psddev.com'
alias reston='ssh reston.psddev.com'

export PATH=/usr/local/bin:$PATH

if [ -e /etc/psd.hostname ] ; then                                                                                                                                                               
     export PSDHOST=$(cat /etc/psd.hostname)
 else
     export PSDHOST=$(hostname)
fi

export PS1='\[\e[0;32m\]\u@${PSDHOST}\[\e[m\]:\[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

 chef-sess (){
    ROLE=$1
    COMMAND=$2
    knife ssh "role:${ROLE}" interactive -a ec2.public_hostname
 }


 chef-run () {
    ROLE=$1
    COMMAND=$2
    knife ssh "role:${ROLE}" -a ec2.public_hostname "${COMMAND}"
  }

  check_json (){
      FILE=$1
      cat ${FILE} | python -m simplejson.tool
  }
