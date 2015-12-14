
# HADOOP environment also for this user...!
export HADOOP_VERSION=2.6.0
export HADOOP_PREFIX=/usr/local/hadoop
export PATH=$HADOOP_PREFIX/bin:$PATH
export HADOOP_JARS=$HADOOP_PREFIX/share/hadoop/tools/lib
export HADOOP_EXAMPLES=$HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples-$HADOOP_VERSION.jar
export HADOOP_STREAMING=$HADOOP_JARS/hadoop-streaming-$HADOOP_VERSION.jar

#echo "Environment loaded"
