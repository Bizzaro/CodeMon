all:
	make clean -i
	javac src/ca/albert_fung/assignment2/*.java -classpath  "/Users/bizzaro/Downloads/glassfish5/glassfish/lib/javaee.jar:." -d ./WEB-INF/classes
	cd /Users/bizzaro/Downloads/apache-tomcat-9.0.1/bin/; ./shutdown.sh
	cd /Users/bizzaro/Downloads/apache-tomcat-9.0.1/bin/; ./startup.sh
	cd ./WEB-INF/classes/; java -Djava.security.policy=policy ca.albert_fung.assignment2.FileServerImpl

clean:
	rm ./submissions/*
	rm -rf ./temp/*
	rm ./log
	rm -rf ./WEB-INF/classes/*

javadoc:
	cd ./src; javadoc -d ../javadoc ca.albert_fung.assignment2
