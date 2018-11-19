FROM afl:latest

COPY afl-fuzz-secondary /app/afl-fuzz-secondary
# RUN $CXX -g -std=c++11 -o /app/maybe-crash /app/maybe-crash.cc

# Load Up Salmon
# COPY salmon-0.11.3-linux_x86_64.tar.gz /app/salmon-0.11.3-linux_x86_64.tar.gz
# RUN tar zxvf /app/salmon-0.11.3-linux_x86_64.tar.gz --directory /app
COPY salmon-0.9.1-linux_x86_64.tar.gz /app/salmon-0.9.1-linux_x86_64.tar.gz
RUN tar zxvf /app/salmon-0.9.1-linux_x86_64.tar.gz --directory /app

# Test file
COPY HOMO_SAPIENS_TRANSCRIPTOME_SHORT/* /app/HOMO_SAPIENS_TRANSCRIPTOME_SHORT/
# COPY HOMO_SAPIENS_TRANSCRIPTOME_LONG/* /app/HOMO_SAPIENS_TRANSCRIPTOME_LONG/
COPY /tests/ERR1562482_1.fastq /app/tests/ERR1562482_1.fastq