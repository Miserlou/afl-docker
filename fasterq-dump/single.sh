#!/bin/bash

#docker run -v afl-results:/results -it afl  /salmon-0.9.1/bin/salmon -i /app/tests -o /results -m 100 -- /salmon-0.9.1/bin/salmon --no-version-check quant --libType A -i /app/HOMO_SAPIENS_TRANSCRIPTOME_SHORT/ -r @@ -o /tmp
docker run -v afl-results:/results -it example-project_primary /usr/local/bin/afl-fuzz -i /app/tests -o /results -m 100 -- /salmon-0.9.1/bin/salmon --no-version-check quant --libType A -i /app/HOMO_SAPIENS_TRANSCRIPTOME_SHORT/ -r @@ -o /tmp
