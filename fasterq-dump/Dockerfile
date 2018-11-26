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

RUN yum -y install git cmake libxml2-devel libmagic-devel libhdf5-devel java-devel

RUN git clone https://github.com/ncbi/ngs.git
WORKDIR ngs/
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc /ngs/configure
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make install

WORKDIR /
RUN git clone https://github.com/ncbi/ncbi-vdb.git
WORKDIR ncbi-vdb/
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc /ncbi-vdb/configure
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make install

WORKDIR /
ADD sra-tools/ /sra-tools/
WORKDIR sra-tools/
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc /sra-tools/configure
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make
RUN CXX=/usr/local/bin/afl-g++ CC=/usr/local/bin/afl-gcc make install

# Test file
# COPY HOMO_SAPIENS_TRANSCRIPTOME_SHORT/* /app/HOMO_SAPIENS_TRANSCRIPTOME_SHORT/
# COPY HOMO_SAPIENS_TRANSCRIPTOME_LONG/* /app/HOMO_SAPIENS_TRANSCRIPTOME_LONG/
# COPY /tests/ERR1562482_1.fastq /app/tests/ERR1562482_1.fastq

# Manual notes:
# Remove Version Checker functions and references in salmon.cpp
# Remove jemalloc installer check

# TODO:
# Fuck with the indexes
# Larger timeouts/get to the meat faster
# Play with --minAssignedFrags 0
# Play with parameters in salmon quant --help-alignment
# Play with `salmon index`