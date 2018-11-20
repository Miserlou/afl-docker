FROM afl:latest

COPY afl-fuzz-secondary /app/afl-fuzz-secondary
# RUN $CXX -g -std=c++11 -o /app/maybe-crash /app/maybe-crash.cc

# Load Up Salmon
# COPY salmon-0.11.3-linux_x86_64.tar.gz /app/salmon-0.11.3-linux_x86_64.tar.gz
# RUN tar zxvf /app/salmon-0.11.3-linux_x86_64.tar.gz --directory /app
# COPY salmon-0.9.1-linux_x86_64.tar.gz /app/salmon-0.9.1-linux_x86_64.tar.gz
# RUN tar zxvf /app/salmon-0.9.1-linux_x86_64.tar.gz --directory /app

# RUN apt-get install -y cmake

# RUN wget https://github.com/COMBINE-lab/salmon/archive/v0.9.1.tar.gz
# RUN tar zxvf v0.9.1.tar.gz
# RUN ls
# RUN make /app/v0.9.1

COPY salmon-0.9.1/ salmon-0.9.1/
RUN yum -y install cmake zlib-devel boost-devel bzip2 bzip2-devel xz-devel libstdc++-static
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jemalloc-3.6.0-1.el7.x86_64.rpm
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jemalloc-devel-3.6.0-1.el7.x86_64.rpm
WORKDIR salmon-0.9.1/
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc cmake -DFETCH_BOOST=TRUE .
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make install

# Test file
COPY HOMO_SAPIENS_TRANSCRIPTOME_SHORT/* /app/HOMO_SAPIENS_TRANSCRIPTOME_SHORT/
# COPY HOMO_SAPIENS_TRANSCRIPTOME_LONG/* /app/HOMO_SAPIENS_TRANSCRIPTOME_LONG/
COPY /tests/ERR1562482_1.fastq /app/tests/ERR1562482_1.fastq

# Manual notes:
# Remove Version Checker functions and references in salmon.cpp
# Remove jemalloc installer check

# TODO:
# Fuck with the indexes
# Larger timeouts/get to the meat faster
# Play with --minAssignedFrags 0
# Play with parameters in salmon quant --help-alignment
# Play with `salmon index`