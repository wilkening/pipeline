{
    "cwlVersion": "v1.0", 
    "$graph": [
        {
            "class": "CommandLineTool", 
            "label": "uncluster sims", 
            "doc": "append feature sequence to each hit line of similarity file\n>add_seq2sims --seq_file --in_sim \n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "add_seq2sims.log", 
            "stderr": "add_seq2sims.error", 
            "inputs": [
                {
                    "type": "string", 
                    "doc": "Output merged sims and seq", 
                    "inputBinding": {
                        "prefix": "--out_sim"
                    }, 
                    "id": "#add_seq2sims.tool.cwl/outName"
                }, 
                {
                    "type": "File", 
                    "doc": "Input tabbed sequence file", 
                    "inputBinding": {
                        "prefix": "--seq_file"
                    }, 
                    "id": "#add_seq2sims.tool.cwl/sequences"
                }, 
                {
                    "type": "File", 
                    "doc": "Input similarity file", 
                    "inputBinding": {
                        "prefix": "--in_sim"
                    }, 
                    "id": "#add_seq2sims.tool.cwl/similarity"
                }
            ], 
            "baseCommand": [
                "add_seq2sims"
            ], 
            "arguments": [
                {
                    "prefix": "--verbose"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#add_seq2sims.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#add_seq2sims.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output merged sims and seq file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#add_seq2sims.tool.cwl/output"
                }
            ], 
            "id": "#add_seq2sims.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "autoskewer", 
            "doc": "detect and trim adapter sequences from reads\n>autoskewer.py -t <runtime.tmpdir> -i <input> -o <outName> -l <outLog>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "autoskewer.log", 
            "stderr": "autoskewer.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Input sequence file", 
                    "inputBinding": {
                        "prefix": "-i"
                    }, 
                    "id": "#autoskewer.tool.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Optional output trimmed log", 
                    "inputBinding": {
                        "prefix": "-l"
                    }, 
                    "id": "#autoskewer.tool.cwl/outLog"
                }, 
                {
                    "type": "string", 
                    "doc": "Output trimmed sequences", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#autoskewer.tool.cwl/outName"
                }
            ], 
            "baseCommand": "autoskewer.py", 
            "arguments": [
                {
                    "prefix": "-t", 
                    "valueFrom": "$(runtime.tmpdir)"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#autoskewer.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#autoskewer.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output trimmed sequences", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#autoskewer.tool.cwl/outTrim"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "Optional output trimmed log file", 
                    "outputBinding": {
                        "glob": "$(inputs.outLog)"
                    }, 
                    "id": "#autoskewer.tool.cwl/trimLog"
                }
            ], 
            "id": "#autoskewer.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "BLAT", 
            "doc": "fast sequence search command line tool\n>blat -fastMap -t dna -q rna -out blast8 <database> <query> <output>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "blat.log", 
            "stderr": "blat.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Database fasta format file", 
                    "inputBinding": {
                        "position": 1
                    }, 
                    "id": "#blat.tool.cwl/database"
                }, 
                {
                    "type": "string", 
                    "doc": "Database type", 
                    "inputBinding": {
                        "prefix": "-t=", 
                        "separate": false
                    }, 
                    "id": "#blat.tool.cwl/dbType"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Run for fast DNA/DNA remapping - not allowing introns", 
                    "inputBinding": {
                        "prefix": "-fastMap"
                    }, 
                    "id": "#blat.tool.cwl/fastMap"
                }, 
                {
                    "type": "string", 
                    "doc": "Output name", 
                    "inputBinding": {
                        "position": 3
                    }, 
                    "id": "#blat.tool.cwl/outName"
                }, 
                {
                    "type": "File", 
                    "doc": "Query fasta format file", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "id": "#blat.tool.cwl/query"
                }, 
                {
                    "type": "string", 
                    "doc": "Query type", 
                    "inputBinding": {
                        "prefix": "-q=", 
                        "separate": false
                    }, 
                    "id": "#blat.tool.cwl/queryType"
                }
            ], 
            "baseCommand": [
                "blat"
            ], 
            "arguments": [
                "-out=blast8"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#blat.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#blat.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output tab separated similarity file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#blat.tool.cwl/output"
                }
            ], 
            "id": "#blat.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "bleachsims", 
            "doc": "filter similarity file by E-value and number of hits\n>bleachsims -s <input> -o <output> -m 20 -r 0 -c 3\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "bleachsims.log", 
            "stderr": "bleachsims.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Remove all evalues with an exponent lower than cutoff, default 3", 
                    "default": 3, 
                    "inputBinding": {
                        "prefix": "-c"
                    }, 
                    "id": "#bleachsims.tool.cwl/cutoff"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "only apply cutoff filter", 
                    "inputBinding": {
                        "prefix": "--eval_only"
                    }, 
                    "id": "#bleachsims.tool.cwl/cutoffOnly"
                }, 
                {
                    "type": "File", 
                    "doc": "Input similarity blast-m8 file", 
                    "inputBinding": {
                        "prefix": "-s"
                    }, 
                    "id": "#bleachsims.tool.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Minimum number of hits per query, default 20", 
                    "default": 20, 
                    "inputBinding": {
                        "prefix": "-m"
                    }, 
                    "id": "#bleachsims.tool.cwl/min"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "only apply cutoff filter", 
                    "inputBinding": {
                        "prefix": "--min_hit_only"
                    }, 
                    "id": "#bleachsims.tool.cwl/minHitOnly"
                }, 
                {
                    "type": "string", 
                    "doc": "Output name", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#bleachsims.tool.cwl/outName"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Best evalue plus this exponent that will be returned, default 0 (no range)", 
                    "default": 0, 
                    "inputBinding": {
                        "prefix": "-r"
                    }, 
                    "id": "#bleachsims.tool.cwl/range"
                }
            ], 
            "baseCommand": [
                "bleachsims"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#bleachsims.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#bleachsims.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output filtered similarity blast-m8 file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#bleachsims.tool.cwl/output"
                }
            ], 
            "id": "#bleachsims.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "GNU cat", 
            "doc": "Concatenate FILE(s) to standard output", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "$(inputs.outName)", 
            "stderr": "cat.error", 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "doc": "List of files to concatenate", 
                    "inputBinding": {
                        "position": 1
                    }, 
                    "id": "#cat.tool.cwl/files"
                }, 
                {
                    "type": "string", 
                    "id": "#cat.tool.cwl/outName"
                }
            ], 
            "baseCommand": [
                "cat"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#cat.tool.cwl/error"
                }, 
                {
                    "type": "File", 
                    "doc": "Concatenated file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#cat.tool.cwl/output"
                }
            ], 
            "id": "#cat.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "CD-HIT-est", 
            "doc": "cluster nucleotide sequences\nuse max available cpus and memory\n>cdhit-est -n 9 -d 0 -T 0 -M 0 -c 0.97 -i <input> -o <output>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "cdhit-est.log", 
            "stderr": "cdhit-est.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "doc": "Percent identity threshold, default 0.97", 
                    "default": 0.97, 
                    "inputBinding": {
                        "prefix": "-c"
                    }, 
                    "id": "#cdhit-est.tool.cwl/identity"
                }, 
                {
                    "type": "File", 
                    "doc": "Input fasta format file", 
                    "inputBinding": {
                        "prefix": "-i"
                    }, 
                    "id": "#cdhit-est.tool.cwl/input"
                }, 
                {
                    "type": "string", 
                    "doc": "Output name", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#cdhit-est.tool.cwl/outName"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Word length, default 9", 
                    "default": 9, 
                    "inputBinding": {
                        "prefix": "-n"
                    }, 
                    "id": "#cdhit-est.tool.cwl/word"
                }
            ], 
            "baseCommand": [
                "cdhit-est"
            ], 
            "arguments": [
                {
                    "prefix": "-M", 
                    "valueFrom": "0"
                }, 
                {
                    "prefix": "-T", 
                    "valueFrom": "0"
                }, 
                {
                    "prefix": "-d", 
                    "valueFrom": "0"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#cdhit-est.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#cdhit-est.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output cluster mapping file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName).clstr"
                    }, 
                    "id": "#cdhit-est.tool.cwl/outClstr"
                }, 
                {
                    "type": "File", 
                    "doc": "Output fasta format file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#cdhit-est.tool.cwl/outSeq"
                }
            ], 
            "id": "#cdhit-est.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "consensus.log", 
            "stderr": "consensus.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "max number of bps to process [default 100]", 
                    "inputBinding": {
                        "prefix": "--bp_max"
                    }, 
                    "id": "#consensus.tool.cwl/basepairs"
                }, 
                {
                    "type": "string", 
                    "doc": "Output file.", 
                    "inputBinding": {
                        "prefix": "--output"
                    }, 
                    "id": "#consensus.tool.cwl/output"
                }, 
                {
                    "type": "File", 
                    "doc": "Input file, sequence (fasta/fastq).", 
                    "inputBinding": {
                        "prefix": "--input"
                    }, 
                    "id": "#consensus.tool.cwl/sequences"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "inputBinding": {
                        "prefix": "--stats"
                    }, 
                    "id": "#consensus.tool.cwl/stats"
                }
            ], 
            "baseCommand": [
                "consensus.py"
            ], 
            "arguments": [
                {
                    "valueFrom": "--verbose"
                }, 
                {
                    "prefix": "--type", 
                    "valueFrom": "${\n    return inputs.sequences.format.split(\"/\").slice(-1)[0]\n} \n"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output)"
                    }, 
                    "id": "#consensus.tool.cwl/consensus"
                }, 
                {
                    "type": "stderr", 
                    "id": "#consensus.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#consensus.tool.cwl/summary"
                }
            ], 
            "id": "#consensus.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "drisee.log", 
            "stderr": "drisee.error", 
            "inputs": [
                {
                    "type": "File", 
                    "inputBinding": {
                        "position": 1
                    }, 
                    "id": "#drisee.tool.cwl/sequences"
                }
            ], 
            "baseCommand": [
                "drisee"
            ], 
            "arguments": [
                {
                    "valueFrom": "drisee.stats", 
                    "position": 2
                }, 
                "--verbose", 
                "--filter_seq", 
                {
                    "valueFrom": "$(runtime.cores)", 
                    "prefix": "--processes"
                }, 
                {
                    "valueFrom": "$(runtime.tmpdir)", 
                    "prefix": "--tmp_dir"
                }, 
                {
                    "prefix": "--seq_type", 
                    "valueFrom": "${\n   return inputs.sequences.format.split(\"/\").slice(-1)[0]\n  } \n"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#drisee.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#drisee.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "drisee.stats"
                    }, 
                    "id": "#drisee.tool.cwl/stats"
                }
            ], 
            "id": "#drisee.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "fastq-mcf", 
            "doc": "fastq quality trimmer\n>fastq-mcf 'n/a' <input> -S -k 0 -l <minLength> --max-ns <maxLqb> -q <minQual> -w <window> -o <outName>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "fastq-mcf.log", 
            "stderr": "fastq-mcf.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Input fastq sequence file", 
                    "inputBinding": {
                        "position": 1
                    }, 
                    "id": "#fastq-mcf.tool.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Maxmium N-calls in a read, default 5", 
                    "default": 5, 
                    "inputBinding": {
                        "prefix": "--max-ns"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/maxLqb"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Minimum remaining sequence length, default 50", 
                    "default": 50, 
                    "inputBinding": {
                        "prefix": "-l"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/minLength"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Quality threshold causing base removal, default 15", 
                    "default": 15, 
                    "inputBinding": {
                        "prefix": "-q"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/minQual"
                }, 
                {
                    "type": "string", 
                    "doc": "Output name", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/outName"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Window-size for quality trimming, default 10", 
                    "default": 10, 
                    "inputBinding": {
                        "prefix": "-w"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/window"
                }
            ], 
            "baseCommand": [
                "fastq-mcf"
            ], 
            "arguments": [
                {
                    "position": 0, 
                    "valueFrom": "n/a"
                }, 
                {
                    "valueFrom": "-S"
                }, 
                {
                    "prefix": "-k", 
                    "valueFrom": "0"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#fastq-mcf.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#fastq-mcf.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output skipped fastq sequences", 
                    "outputBinding": {
                        "glob": "$(inputs.outName).skip"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/outSkip"
                }, 
                {
                    "type": "File", 
                    "doc": "Output trimmed fastq sequences", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#fastq-mcf.tool.cwl/outTrim"
                }
            ], 
            "id": "#fastq-mcf.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "cluster file reformat", 
            "doc": "re-formats cd-hit .clstr file into mg-rast .mapping file\n>format_cluster.pl --input <input> --output <output>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "format_cluster.log", 
            "stderr": "format_cluster.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Input .clstr format file", 
                    "inputBinding": {
                        "prefix": "--input"
                    }, 
                    "id": "#format_cluster.tool.cwl/input"
                }, 
                {
                    "type": "string", 
                    "doc": "Output .mapping format file", 
                    "inputBinding": {
                        "prefix": "--output"
                    }, 
                    "id": "#format_cluster.tool.cwl/outName"
                }
            ], 
            "baseCommand": [
                "format_cluster.pl"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#format_cluster.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#format_cluster.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output .mapping format file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#format_cluster.tool.cwl/output"
                }
            ], 
            "id": "#format_cluster.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "format_qc_stats.stats", 
            "stderr": "format_qc_stats.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "consensus stat file", 
                    "inputBinding": {
                        "prefix": "-consensus"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/consensus"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "coverage stat file", 
                    "inputBinding": {
                        "prefix": "-coverage"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/coverage"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "drisee info file", 
                    "inputBinding": {
                        "prefix": "-drisee_info"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/driseeInfo"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "drisee stat file", 
                    "inputBinding": {
                        "prefix": "-drisee_stat"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/driseeStat"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": {
                            "type": "record", 
                            "fields": [
                                {
                                    "name": "#format_qc_stats.tool.cwl/kmer/length", 
                                    "type": "int"
                                }, 
                                {
                                    "name": "#format_qc_stats.tool.cwl/kmer/file", 
                                    "type": "File"
                                }
                            ]
                        }
                    }, 
                    "doc": "kmer record array", 
                    "id": "#format_qc_stats.tool.cwl/kmer"
                }, 
                {
                    "type": "string", 
                    "doc": "output prefix = ${output_prefix}.seq.bins, ${output_prefix}.seq.stats", 
                    "inputBinding": {
                        "prefix": "-out_prefix"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/outPrefix"
                }
            ], 
            "baseCommand": [
                "format_qc_stats.pl"
            ], 
            "arguments": [
                {
                    "prefix": "-kmer_lens", 
                    "valueFrom": "${\n    return inputs.kmer.map( \n        function(r){ return r.length }\n    ).join();\n}\n"
                }, 
                {
                    "prefix": "-kmer_stats", 
                    "valueFrom": "${\n    return inputs.kmer.map( \n        function(r){ return r.file.path }\n    ).join();\n}\n"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#format_qc_stats.tool.cwl/error"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outPrefix).qc.stats"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/stats"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.outPrefix).qc.summary"
                    }, 
                    "id": "#format_qc_stats.tool.cwl/summary"
                }
            ], 
            "id": "#format_qc_stats.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "stdout": "format_seq_stats.stats", 
            "stderr": "format_seq_stats.error", 
            "inputs": [
                {
                    "type": "string", 
                    "doc": "output prefix, e.g. ${output_prefix}.seq.bins, ${output_prefix}.seq.stats", 
                    "inputBinding": {
                        "prefix": "-out_prefix"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/output_prefix"
                }, 
                {
                    "type": "File", 
                    "doc": "gc bin file", 
                    "inputBinding": {
                        "prefix": "-seq_gc"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/sequence_gc"
                }, 
                {
                    "type": "File", 
                    "doc": "len bin file", 
                    "inputBinding": {
                        "prefix": "-seq_lens"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/sequence_lengths"
                }, 
                {
                    "doc": "stats tabbed file", 
                    "type": "File", 
                    "inputBinding": {
                        "prefix": "-seq_stat"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/sequence_stats"
                }
            ], 
            "baseCommand": [
                "format_seq_stats.pl"
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).seq.bins"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/bins"
                }, 
                {
                    "type": "stderr", 
                    "id": "#format_seq_stats.tool.cwl/error"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output_prefix).seq.stats"
                    }, 
                    "id": "#format_seq_stats.tool.cwl/stats"
                }
            ], 
            "id": "#format_seq_stats.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "index sims by md5", 
            "doc": "index m8 format blast file by 2nd column (sorted required)\nreturn: value, seek, length for each record\n>index_sims_file_md5 --in_file <input> --out_file <outName> --md5_num <number>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "index_sims_file_md5.log", 
            "stderr": "index_sims_file_md5.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Input similarity blast-m8 file", 
                    "inputBinding": {
                        "prefix": "--in_file"
                    }, 
                    "id": "#index_sims_file_md5.tool.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Number of chunks to load in memory at once before processing, default is 5000", 
                    "default": 5000, 
                    "inputBinding": {
                        "prefix": "--md5_num"
                    }, 
                    "id": "#index_sims_file_md5.tool.cwl/number"
                }, 
                {
                    "type": "string", 
                    "doc": "Output index", 
                    "inputBinding": {
                        "prefix": "--out_file"
                    }, 
                    "id": "#index_sims_file_md5.tool.cwl/outName"
                }
            ], 
            "baseCommand": [
                "index_sims_file_md5"
            ], 
            "arguments": [
                {
                    "valueFrom": "--verbose"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#index_sims_file_md5.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#index_sims_file_md5.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output index file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#index_sims_file_md5.tool.cwl/output"
                }
            ], 
            "id": "#index_sims_file_md5.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "calcualate kmer bins", 
            "doc": "Script to use jellyfish to get kmer information\nInput:\\ fasta/fastq file\nOutput:\\ kmer information, one of:\\\n    1. hash:\\ binary hash of counts\n    2. stats:\\ summary stats\n    3. dump:\\ profile (kmer seq - count)\n    4. histo:\\ histogram (count - abundance)\n    5. histo ranked:\\ count, abundance, count*abundance, reverse-sum(abundance), reverse-sum(count*abundance), ratio-to-largest\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "kmer-tool.log", 
            "stderr": "kmer-tool.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Output format, one of [hash, stats, dump, histo], default histo", 
                    "default": "histo", 
                    "inputBinding": {
                        "prefix": "--format"
                    }, 
                    "id": "#kmer-tool.tool.cwl/format"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Length of kmer to use, eg. 6 or 15", 
                    "default": 6, 
                    "inputBinding": {
                        "prefix": "--length"
                    }, 
                    "id": "#kmer-tool.tool.cwl/length"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "doc": "Maximum size (in Gb) to count, files larger are split, default 10.0", 
                    "default": 10.0, 
                    "inputBinding": {
                        "prefix": "--max"
                    }, 
                    "id": "#kmer-tool.tool.cwl/maxSize"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Prefix for output file(s)", 
                    "default": "qc", 
                    "id": "#kmer-tool.tool.cwl/prefix"
                }, 
                {
                    "type": "File", 
                    "doc": "Input file, sequence (fasta/fastq) or binary count hash (hash).", 
                    "inputBinding": {
                        "prefix": "--input"
                    }, 
                    "id": "#kmer-tool.tool.cwl/sequences"
                }
            ], 
            "baseCommand": [
                "kmer-tool"
            ], 
            "arguments": [
                "--ranked", 
                {
                    "prefix": "--procs", 
                    "valueFrom": "$(runtime.cores)"
                }, 
                {
                    "prefix": "--type", 
                    "valueFrom": "${\n    return inputs.sequences.format.split(\"/\").slice(-1)[0]\n}\n"
                }, 
                {
                    "prefix": "--tmpdir", 
                    "valueFrom": "$(runtime.outdir)"
                }, 
                {
                    "prefix": "--output", 
                    "valueFrom": "$(inputs.prefix).kmer.$(inputs.length).stats"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#kmer-tool.tool.cwl/error"
                }, 
                {
                    "type": {
                        "type": "record", 
                        "label": "none", 
                        "fields": [
                            {
                                "name": "#kmer-tool.tool.cwl/stats/length", 
                                "type": "int", 
                                "outputBinding": {
                                    "outputEval": "$(inputs.length)"
                                }
                            }, 
                            {
                                "name": "#kmer-tool.tool.cwl/stats/file", 
                                "type": "File", 
                                "outputBinding": {
                                    "glob": "$(inputs.prefix).kmer.$(inputs.length).stats"
                                }
                            }
                        ]
                    }, 
                    "id": "#kmer-tool.tool.cwl/stats"
                }, 
                {
                    "type": "stdout", 
                    "id": "#kmer-tool.tool.cwl/summary"
                }
            ], 
            "id": "#kmer-tool.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "rna features", 
            "doc": "identify rRNAs features from given rRNA fasta and blast aligned files\n>rna_feature.pl --seq <sequence> --sim <aligned> --ident 75 --output <output>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "rna_feature.log", 
            "stderr": "rna_feature.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "Tab separated similarity file", 
                    "inputBinding": {
                        "prefix": "--sim"
                    }, 
                    "id": "#rna_feature.tool.cwl/aligned"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Percent identity threshold, default 75", 
                    "default": 75, 
                    "inputBinding": {
                        "prefix": "--ident"
                    }, 
                    "id": "#rna_feature.tool.cwl/identity"
                }, 
                {
                    "type": "string", 
                    "doc": "Output fasta format file", 
                    "inputBinding": {
                        "prefix": "--output"
                    }, 
                    "id": "#rna_feature.tool.cwl/outName"
                }, 
                {
                    "type": "File", 
                    "doc": "Tab separated sequence file", 
                    "inputBinding": {
                        "prefix": "--seq"
                    }, 
                    "id": "#rna_feature.tool.cwl/sequence"
                }
            ], 
            "baseCommand": [
                "rna_feature.pl"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#rna_feature.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#rna_feature.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output fasta format file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#rna_feature.tool.cwl/output"
                }
            ], 
            "id": "#rna_feature.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "seqUtil", 
            "doc": "Utility tool for various sequence file transformations.\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "seqUtil.log", 
            "stderr": "seqUtil.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Return fasta with each sequence truncated to 1024 bps", 
                    "inputBinding": {
                        "prefix": "--bowtie_truncate"
                    }, 
                    "id": "#seqUtil.tool.cwl/bowtieTruncate"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Transform fasta to tabbed", 
                    "inputBinding": {
                        "prefix": "--fasta2tab"
                    }, 
                    "id": "#seqUtil.tool.cwl/fasta2tab"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Transform fastq to fasta", 
                    "inputBinding": {
                        "prefix": "--fastq2fasta"
                    }, 
                    "id": "#seqUtil.tool.cwl/fastq2fasta"
                }, 
                {
                    "type": "string", 
                    "doc": "Output sequence file", 
                    "inputBinding": {
                        "prefix": "--output"
                    }, 
                    "id": "#seqUtil.tool.cwl/output"
                }, 
                {
                    "type": "File", 
                    "doc": "Input sequence file", 
                    "inputBinding": {
                        "prefix": "--input"
                    }, 
                    "id": "#seqUtil.tool.cwl/sequences"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Sort fasta file by ID", 
                    "inputBinding": {
                        "prefix": "--sortbyid"
                    }, 
                    "id": "#seqUtil.tool.cwl/sortbyid"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Transform fasta to ID list, sorted by ID", 
                    "inputBinding": {
                        "prefix": "--sortbyid2id"
                    }, 
                    "id": "#seqUtil.tool.cwl/sortbyid2id"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Transform fasta to tabbed, sorted by ID", 
                    "inputBinding": {
                        "prefix": "--sortbyid2tab"
                    }, 
                    "id": "#seqUtil.tool.cwl/sortbyid2tab"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "List of sequences to subset input by, required with subsetSeqs option", 
                    "inputBinding": {
                        "prefix": "--list"
                    }, 
                    "id": "#seqUtil.tool.cwl/subsetList"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Return fasta with each sequence truncated to 1024 bps", 
                    "inputBinding": {
                        "prefix": "--subset_seqs"
                    }, 
                    "id": "#seqUtil.tool.cwl/subsetSeqs"
                }
            ], 
            "baseCommand": [
                "seqUtil"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#seqUtil.tool.cwl/error"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "$(inputs.output)"
                    }, 
                    "id": "#seqUtil.tool.cwl/file"
                }, 
                {
                    "type": "stdout", 
                    "id": "#seqUtil.tool.cwl/info"
                }
            ], 
            "id": "#seqUtil.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "sequence statistics", 
            "doc": "Calculate statistics for fasta files.\nOutput fields:\\\n  bp_count\n  sequence_count\n  average_length\n  standard_deviation_length\n  length_min\n  length_max\n  average_gc_content\n  standard_deviation_gc_content\n  average_gc_ratio\n  standard_deviation_gc_ratio\n  ambig_char_count\n  ambig_sequence_count\n  average_ambig_chars\n  sequence_type\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "seq_length_stats.stats", 
            "stderr": "seq_length_stats.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Fast stats, length and count only, for protein sequences", 
                    "inputBinding": {
                        "prefix": "--fast"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/fast"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Filename to place gc bins", 
                    "inputBinding": {
                        "prefix": "--gc_percent_bin"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/gcBin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Ignore commas in header ID", 
                    "inputBinding": {
                        "prefix": "--ignore_comma"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/ignoreComma"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Filename to place length bins [default is no output]", 
                    "inputBinding": {
                        "prefix": "--length_bin"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/lenBin"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Output stats in json format, default is tabbed text", 
                    "inputBinding": {
                        "prefix": "--json"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/outJson"
                }, 
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "Output stats file name, if not called prints to STDOUT", 
                    "inputBinding": {
                        "prefix": "--output"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/outName"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "max number of seqs to process (for kmer entropy)", 
                    "default": 100000, 
                    "inputBinding": {
                        "prefix": "--seq_max"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/seqMax"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Guess sequence type [wgs|amplicon] from kmer entropy", 
                    "inputBinding": {
                        "prefix": "--seq_type"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/seqType"
                }, 
                {
                    "type": "File", 
                    "doc": "Input file, sequence (fasta/fastq)", 
                    "inputBinding": {
                        "prefix": "--input"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/sequences"
                }
            ], 
            "baseCommand": [
                "seq_length_stats.py"
            ], 
            "arguments": [
                {
                    "prefix": "--type", 
                    "valueFrom": "${\n    return inputs.sequences.format.split(\"/\").slice(-1)[0]\n}\n"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#seq_length_stats.tool.cwl/error"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.gcBin)"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/gcBinOut"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.lenBin)"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/lenBinOut"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#seq_length_stats.tool.cwl/statOut"
                }, 
                {
                    "type": "stdout", 
                    "id": "#seq_length_stats.tool.cwl/stdout"
                }
            ], 
            "id": "#seq_length_stats.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "abundance profile", 
            "doc": "create abundance profile from expanded annotated sims files\nmd5:    sims_abundance.py -t md5 -i <input> -o <output> --coverage <coverage> --cluster <cluster> --md5index <md5index>\nlca:    sims_abundance.py -t lca -i <input> -o <output> --coverage <coverage> --cluster <cluster>\nsource: sims_abundance.py -t source -i <input> -o <output> --coverage <coverage> --cluster <cluster>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "sims_abundance.log", 
            "stderr": "sims_abundance.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "File", 
                            "inputBinding": {
                                "prefix": "--cluster"
                            }
                        }
                    ], 
                    "doc": "Optional input file(s), cluster mapping", 
                    "id": "#sims_abundance.tool.cwl/cluster"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "Optional input file, assembly coverage", 
                    "inputBinding": {
                        "prefix": "--coverage"
                    }, 
                    "id": "#sims_abundance.tool.cwl/coverage"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File", 
                        "inputBinding": {
                            "prefix": "-i"
                        }
                    }, 
                    "doc": "Input expanded sims file", 
                    "id": "#sims_abundance.tool.cwl/input"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "Optional input file, md5,seek,length", 
                    "inputBinding": {
                        "prefix": "--md5_index"
                    }, 
                    "id": "#sims_abundance.tool.cwl/md5index"
                }, 
                {
                    "type": "string", 
                    "doc": "Output abundance profile", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#sims_abundance.tool.cwl/outName"
                }, 
                {
                    "type": "string", 
                    "doc": "Profile type", 
                    "inputBinding": {
                        "prefix": "-t"
                    }, 
                    "id": "#sims_abundance.tool.cwl/profileType"
                }
            ], 
            "baseCommand": [
                "sims_abundance.py"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#sims_abundance.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#sims_abundance.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output abundance profile file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#sims_abundance.tool.cwl/output"
                }
            ], 
            "id": "#sims_abundance.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "annotate sims", 
            "doc": "create expanded annotated sims files from input md5 sim file and m5nr db\nsims_annotate.pl --verbose --in_sim <input> --in_scg <scgs> --ann_file <database> --format <seqFormat> --out_filter <outFilter> --out_expand <outExpand> -out_lca <outLca> --frag_num 5000\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "sims_annotate.log", 
            "stderr": "sims_annotate.error", 
            "inputs": [
                {
                    "type": "File", 
                    "doc": "BerkelyDB of condensed M5NR", 
                    "inputBinding": {
                        "prefix": "--ann_file"
                    }, 
                    "id": "#sims_annotate.tool.cwl/database"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Number of fragment chunks to load in memory at once before processing, default 5000", 
                    "default": 5000, 
                    "inputBinding": {
                        "prefix": "--frag_num"
                    }, 
                    "id": "#sims_annotate.tool.cwl/fragNum"
                }, 
                {
                    "type": "File", 
                    "doc": "Input similarity blast-m8 file", 
                    "inputBinding": {
                        "prefix": "--in_sim"
                    }, 
                    "id": "#sims_annotate.tool.cwl/input"
                }, 
                {
                    "type": "string", 
                    "doc": "Output expanded protein sim file (protein mode only)", 
                    "inputBinding": {
                        "prefix": "--out_expand"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outExpandName"
                }, 
                {
                    "type": "string", 
                    "doc": "Output filtered sim file", 
                    "inputBinding": {
                        "prefix": "--out_filter"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outFilterName"
                }, 
                {
                    "type": "string", 
                    "doc": "Output expanded LCA file (protein and rna mode)", 
                    "inputBinding": {
                        "prefix": "--out_lca"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outLcaName"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "md5 single copy gene file", 
                    "inputBinding": {
                        "prefix": "--in_scg"
                    }, 
                    "id": "#sims_annotate.tool.cwl/scgs"
                }, 
                {
                    "type": "string", 
                    "doc": "Type of sequences data in input file, rna or protein", 
                    "default": "protein", 
                    "inputBinding": {
                        "prefix": "--format"
                    }, 
                    "id": "#sims_annotate.tool.cwl/seqFormat"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "Verbose logging mode", 
                    "inputBinding": {
                        "prefix": "--verbose"
                    }, 
                    "id": "#sims_annotate.tool.cwl/verbose"
                }
            ], 
            "baseCommand": [
                "sims_annotate.pl"
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#sims_annotate.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#sims_annotate.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output expanded sim file", 
                    "outputBinding": {
                        "glob": "$(inputs.outExpandName)"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outExpand"
                }, 
                {
                    "type": "File", 
                    "doc": "Output filtered similarity file", 
                    "outputBinding": {
                        "glob": "$(inputs.outFilterName)"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outFilter"
                }, 
                {
                    "type": "File", 
                    "doc": "Output expanded LCA file", 
                    "outputBinding": {
                        "glob": "$(inputs.outLcaName)"
                    }, 
                    "id": "#sims_annotate.tool.cwl/outLca"
                }
            ], 
            "id": "#sims_annotate.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "GNU sort", 
            "doc": "sort text file base on given field(s)", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "sort.log", 
            "stderr": "sort.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "string"
                    ], 
                    "doc": "use SEP instead of non-blank to blank transition, default is tab", 
                    "inputBinding": {
                        "prefix": "-t", 
                        "valueFrom": "$(\"\\u0009\")"
                    }, 
                    "id": "#sort.tool.cwl/field"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "doc": "Files to sort", 
                    "inputBinding": {
                        "position": 2
                    }, 
                    "id": "#sort.tool.cwl/input"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "string", 
                        "inputBinding": {
                            "prefix": "-k"
                        }
                    }, 
                    "doc": "start a key at POS1, end it at POS2 (origin 1)", 
                    "inputBinding": {
                        "position": 1
                    }, 
                    "id": "#sort.tool.cwl/key"
                }, 
                {
                    "type": [
                        "null", 
                        "boolean"
                    ], 
                    "doc": "merge only, the input files are assumed to be pre-sorted", 
                    "inputBinding": {
                        "prefix": "-m"
                    }, 
                    "id": "#sort.tool.cwl/merge"
                }, 
                {
                    "type": "string", 
                    "doc": "write result to FILE instead of standard output", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#sort.tool.cwl/outName"
                }
            ], 
            "baseCommand": [
                "sort"
            ], 
            "arguments": [
                {
                    "prefix": "-T", 
                    "valueFrom": "$(runtime.tmpdir)"
                }, 
                {
                    "prefix": "-S", 
                    "valueFrom": "$(runtime.ram)M"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#sort.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#sort.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "The sorted file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#sort.tool.cwl/output"
                }
            ], 
            "id": "#sort.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "sortmerna", 
            "doc": "align rRNA fasta file against clustered rRNA index\noutput in blast m8 format\n>sortmerna -a <# core> -m <MB ram> -e 0.1 --blast '1 cigar qcov qstrand' --ref '<refFasta>,<indexDir>/<indexName>' --reads <input> --aligned <input basename>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "sortmerna.log", 
            "stderr": "sortmerna.error", 
            "inputs": [
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "doc": "E-value threshold, default 0.1", 
                    "default": 0.1, 
                    "inputBinding": {
                        "prefix": "-e"
                    }, 
                    "id": "#sortmerna.tool.cwl/evalue"
                }, 
                {
                    "type": [
                        "null", 
                        "Directory"
                    ], 
                    "doc": "Directory containing index files with prefix INDEXNAME", 
                    "default": "./", 
                    "id": "#sortmerna.tool.cwl/indexDir"
                }, 
                {
                    "type": "string", 
                    "doc": "Prefix for index files", 
                    "id": "#sortmerna.tool.cwl/indexName"
                }, 
                {
                    "type": "File", 
                    "doc": "Input file, sequence (fasta/fastq)", 
                    "inputBinding": {
                        "prefix": "--reads"
                    }, 
                    "id": "#sortmerna.tool.cwl/input"
                }, 
                {
                    "type": "File", 
                    "doc": "Reference .fasta file", 
                    "id": "#sortmerna.tool.cwl/refFasta"
                }
            ], 
            "baseCommand": [
                "sortmerna"
            ], 
            "arguments": [
                {
                    "prefix": "--blast", 
                    "valueFrom": "1 cigar qcov qstrand"
                }, 
                {
                    "prefix": "-a", 
                    "valueFrom": "$(runtime.cores)"
                }, 
                {
                    "prefix": "--ref", 
                    "valueFrom": "$(inputs.refFasta.path),$(inputs.indexDir.path)/$(inputs.indexName)"
                }, 
                {
                    "prefix": "--aligned", 
                    "valueFrom": "$(inputs.input.basename)"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#sortmerna.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#sortmerna.tool.cwl/info"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "doc": "Output tab separated aligned file", 
                    "outputBinding": {
                        "glob": "$(inputs.input.basename).blast"
                    }, 
                    "id": "#sortmerna.tool.cwl/output"
                }
            ], 
            "id": "#sortmerna.tool.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "uncluster sims", 
            "doc": "expand out similarity file (blast m8) by turning each cluster seed hit into a hit per cluster member\n>uncluster_sims.py <input> <outName> --cfile <cluster> --position <position>\n", 
            "hints": [
                {
                    "dockerPull": "mgrast/pipeline:4.03", 
                    "class": "DockerRequirement"
                }
            ], 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "stdout": "uncluster_sims.log", 
            "stderr": "uncluster_sims.error", 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File", 
                        "inputBinding": {
                            "prefix": "-c"
                        }
                    }, 
                    "doc": "Input cluster mapping files", 
                    "id": "#uncluster_sims.tool.cwl/clustMap"
                }, 
                {
                    "type": "string", 
                    "doc": "Output unclustered similarity", 
                    "inputBinding": {
                        "prefix": "-o"
                    }, 
                    "id": "#uncluster_sims.tool.cwl/outName"
                }, 
                {
                    "type": [
                        "null", 
                        "int"
                    ], 
                    "doc": "Column position of query in sims file, default is 1", 
                    "default": 1, 
                    "inputBinding": {
                        "prefix": "--position"
                    }, 
                    "id": "#uncluster_sims.tool.cwl/position"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File", 
                        "inputBinding": {
                            "prefix": "-i"
                        }
                    }, 
                    "doc": "Input similarity hit files", 
                    "id": "#uncluster_sims.tool.cwl/simHit"
                }
            ], 
            "baseCommand": [
                "uncluster_sims.py"
            ], 
            "arguments": [
                {
                    "valueFrom": "--verbose"
                }, 
                {
                    "prefix": "--db", 
                    "valueFrom": "$(runtime.tmpdir)"
                }
            ], 
            "outputs": [
                {
                    "type": "stderr", 
                    "id": "#uncluster_sims.tool.cwl/error"
                }, 
                {
                    "type": "stdout", 
                    "id": "#uncluster_sims.tool.cwl/info"
                }, 
                {
                    "type": "File", 
                    "doc": "Output unclustered similarity file", 
                    "outputBinding": {
                        "glob": "$(inputs.outName)"
                    }, 
                    "id": "#uncluster_sims.tool.cwl/output"
                }
            ], 
            "id": "#uncluster_sims.tool.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "abundance", 
            "doc": "abundace profiles from annotated files, for protein and/or rna", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#abundance.workflow.cwl/clustMaps"
                }, 
                {
                    "type": [
                        "null", 
                        "File"
                    ], 
                    "id": "#abundance.workflow.cwl/coverage"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#abundance.workflow.cwl/expandSims"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#abundance.workflow.cwl/filterSims"
                }, 
                {
                    "type": "string", 
                    "id": "#abundance.workflow.cwl/jobid"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#abundance.workflow.cwl/lcaAnns"
                }, 
                {
                    "type": "File", 
                    "id": "#abundance.workflow.cwl/md5index"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#abundance.workflow.cwl/lcaProfile/output", 
                    "id": "#abundance.workflow.cwl/lcaProfileOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#abundance.workflow.cwl/md5Profile/output", 
                    "id": "#abundance.workflow.cwl/md5ProfileOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#abundance.workflow.cwl/sourceStats/output", 
                    "id": "#abundance.workflow.cwl/sourceStatsOut"
                }
            ], 
            "steps": [
                {
                    "run": "#sims_abundance.tool.cwl", 
                    "in": [
                        {
                            "source": "#abundance.workflow.cwl/clustMaps", 
                            "id": "#abundance.workflow.cwl/lcaProfile/cluster"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/coverage", 
                            "id": "#abundance.workflow.cwl/lcaProfile/coverage"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/lcaAnns", 
                            "id": "#abundance.workflow.cwl/lcaProfile/input"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/jobid", 
                            "valueFrom": "$(self).700.annotation.lca.abundance", 
                            "id": "#abundance.workflow.cwl/lcaProfile/outName"
                        }, 
                        {
                            "valueFrom": "lca", 
                            "id": "#abundance.workflow.cwl/lcaProfile/profileType"
                        }
                    ], 
                    "out": [
                        "#abundance.workflow.cwl/lcaProfile/output"
                    ], 
                    "id": "#abundance.workflow.cwl/lcaProfile"
                }, 
                {
                    "run": "#sims_abundance.tool.cwl", 
                    "in": [
                        {
                            "source": "#abundance.workflow.cwl/clustMaps", 
                            "id": "#abundance.workflow.cwl/md5Profile/cluster"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/coverage", 
                            "id": "#abundance.workflow.cwl/md5Profile/coverage"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/filterSims", 
                            "id": "#abundance.workflow.cwl/md5Profile/input"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/md5index", 
                            "id": "#abundance.workflow.cwl/md5Profile/md5index"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/jobid", 
                            "valueFrom": "$(self).700.annotation.md5.abundance", 
                            "id": "#abundance.workflow.cwl/md5Profile/outName"
                        }, 
                        {
                            "valueFrom": "md5", 
                            "id": "#abundance.workflow.cwl/md5Profile/profileType"
                        }
                    ], 
                    "out": [
                        "#abundance.workflow.cwl/md5Profile/output"
                    ], 
                    "id": "#abundance.workflow.cwl/md5Profile"
                }, 
                {
                    "run": "#sims_abundance.tool.cwl", 
                    "in": [
                        {
                            "source": "#abundance.workflow.cwl/clustMaps", 
                            "id": "#abundance.workflow.cwl/sourceStats/cluster"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/coverage", 
                            "id": "#abundance.workflow.cwl/sourceStats/coverage"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/expandSims", 
                            "id": "#abundance.workflow.cwl/sourceStats/input"
                        }, 
                        {
                            "source": "#abundance.workflow.cwl/jobid", 
                            "valueFrom": "$(self).700.annotation.source.stats", 
                            "id": "#abundance.workflow.cwl/sourceStats/outName"
                        }, 
                        {
                            "valueFrom": "source", 
                            "id": "#abundance.workflow.cwl/sourceStats/profileType"
                        }
                    ], 
                    "out": [
                        "#abundance.workflow.cwl/sourceStats/output"
                    ], 
                    "id": "#abundance.workflow.cwl/sourceStats"
                }
            ], 
            "id": "#abundance.workflow.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "rna amplicon analysis for fastq files", 
            "doc": "RNAs - qc, preprocess, annotation, index, abundance", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }, 
                {
                    "class": "SubworkflowFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#main/jobid"
                }, 
                {
                    "type": "File", 
                    "id": "#main/m5nrBDB"
                }, 
                {
                    "type": "File", 
                    "id": "#main/m5rnaClust"
                }, 
                {
                    "type": "File", 
                    "id": "#main/m5rnaFull"
                }, 
                {
                    "type": "Directory", 
                    "id": "#main/m5rnaIndex"
                }, 
                {
                    "type": "string", 
                    "id": "#main/m5rnaPrefix"
                }, 
                {
                    "type": "int", 
                    "default": 5, 
                    "id": "#main/maxLqb"
                }, 
                {
                    "type": "int", 
                    "default": 15, 
                    "id": "#main/minQual"
                }, 
                {
                    "type": "File", 
                    "id": "#main/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#main/preProcess/trimmed", 
                    "id": "#main/adapterPassed"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/abundance/lcaProfileOut", 
                    "id": "#main/lcaProfileOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/abundance/md5ProfileOut", 
                    "id": "#main/md5ProfileOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/preProcess/passed", 
                    "id": "#main/preProcessPassed"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/preProcess/removed", 
                    "id": "#main/preProcessRemoved"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/qcBasic/qcStatFile", 
                    "id": "#main/qcStatOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/qcBasic/qcSummaryFile", 
                    "id": "#main/qcSummaryOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/annotate/rnaClustMapOut", 
                    "id": "#main/rnaClustMapOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/annotate/rnaClustSeqOut", 
                    "id": "#main/rnaClustSeqOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/annotate/rnaFeatureOut", 
                    "id": "#main/rnaFeatureOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/annotate/rnaSimsOut", 
                    "id": "#main/rnaSimsOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/qcBasic/seqBinFile", 
                    "id": "#main/seqBinOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/qcBasic/seqStatFile", 
                    "id": "#main/seqStatOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/indexSimSeq/simSeqOut", 
                    "id": "#main/simSeqOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#main/abundance/sourceStatsOut", 
                    "id": "#main/sourceStatsOut"
                }
            ], 
            "steps": [
                {
                    "run": "#abundance.workflow.cwl", 
                    "in": [
                        {
                            "source": "#main/annotate/rnaClustMapOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/abundance/clustMaps"
                        }, 
                        {
                            "source": "#main/annotate/rnaExpandOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/abundance/expandSims"
                        }, 
                        {
                            "source": "#main/annotate/rnaFilterOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/abundance/filterSims"
                        }, 
                        {
                            "source": "#main/jobid", 
                            "id": "#main/abundance/jobid"
                        }, 
                        {
                            "source": "#main/annotate/rnaLCAOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/abundance/lcaAnns"
                        }, 
                        {
                            "source": "#main/indexSimSeq/indexOut", 
                            "id": "#main/abundance/md5index"
                        }
                    ], 
                    "out": [
                        "#main/abundance/md5ProfileOut", 
                        "#main/abundance/lcaProfileOut", 
                        "#main/abundance/sourceStatsOut"
                    ], 
                    "id": "#main/abundance"
                }, 
                {
                    "run": "#rna-annotation.workflow.cwl", 
                    "in": [
                        {
                            "source": "#main/jobid", 
                            "id": "#main/annotate/jobid"
                        }, 
                        {
                            "source": "#main/m5nrBDB", 
                            "id": "#main/annotate/m5nrBDB"
                        }, 
                        {
                            "source": "#main/m5rnaClust", 
                            "id": "#main/annotate/m5rnaClust"
                        }, 
                        {
                            "source": "#main/m5rnaFull", 
                            "id": "#main/annotate/m5rnaFull"
                        }, 
                        {
                            "source": "#main/m5rnaIndex", 
                            "id": "#main/annotate/m5rnaIndex"
                        }, 
                        {
                            "source": "#main/m5rnaPrefix", 
                            "id": "#main/annotate/m5rnaPrefix"
                        }, 
                        {
                            "source": "#main/preProcess/passed", 
                            "id": "#main/annotate/sequences"
                        }
                    ], 
                    "out": [
                        "#main/annotate/rnaFeatureOut", 
                        "#main/annotate/rnaClustSeqOut", 
                        "#main/annotate/rnaClustMapOut", 
                        "#main/annotate/rnaSimsOut", 
                        "#main/annotate/rnaFilterOut", 
                        "#main/annotate/rnaExpandOut", 
                        "#main/annotate/rnaLCAOut"
                    ], 
                    "id": "#main/annotate"
                }, 
                {
                    "run": "#index_sim_seq.workflow.cwl", 
                    "in": [
                        {
                            "source": "#main/annotate/rnaClustMapOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/indexSimSeq/clustMaps"
                        }, 
                        {
                            "source": "#main/annotate/rnaFeatureOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/indexSimSeq/featureSeqs"
                        }, 
                        {
                            "source": "#main/annotate/rnaFilterOut", 
                            "valueFrom": "${ return [self]; }", 
                            "id": "#main/indexSimSeq/filterSims"
                        }, 
                        {
                            "source": "#main/jobid", 
                            "id": "#main/indexSimSeq/jobid"
                        }
                    ], 
                    "out": [
                        "#main/indexSimSeq/simSeqOut", 
                        "#main/indexSimSeq/indexOut"
                    ], 
                    "id": "#main/indexSimSeq"
                }, 
                {
                    "run": "#preprocess-fastq.workflow.cwl", 
                    "in": [
                        {
                            "source": "#main/jobid", 
                            "id": "#main/preProcess/jobid"
                        }, 
                        {
                            "source": "#main/maxLqb", 
                            "id": "#main/preProcess/maxLqb"
                        }, 
                        {
                            "source": "#main/minQual", 
                            "id": "#main/preProcess/minQual"
                        }, 
                        {
                            "source": "#main/sequences", 
                            "id": "#main/preProcess/sequences"
                        }
                    ], 
                    "out": [
                        "#main/preProcess/trimmed", 
                        "#main/preProcess/passed", 
                        "#main/preProcess/removed"
                    ], 
                    "id": "#main/preProcess"
                }, 
                {
                    "run": "#qc-basic.workflow.cwl", 
                    "in": [
                        {
                            "source": "#main/jobid", 
                            "id": "#main/qcBasic/jobid"
                        }, 
                        {
                            "valueFrom": "${ return [6, 15]; }", 
                            "id": "#main/qcBasic/kmerLength"
                        }, 
                        {
                            "source": "#main/sequences", 
                            "id": "#main/qcBasic/sequences"
                        }
                    ], 
                    "out": [
                        "#main/qcBasic/seqStatFile", 
                        "#main/qcBasic/seqBinFile", 
                        "#main/qcBasic/qcStatFile", 
                        "#main/qcBasic/qcSummaryFile"
                    ], 
                    "id": "#main/qcBasic"
                }
            ], 
            "id": "#main"
        }, 
        {
            "class": "Workflow", 
            "label": "index sim seq", 
            "doc": "create sorted / filtered similarity file with feature sequences, and index by md5", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#index_sim_seq.workflow.cwl/clustMaps"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#index_sim_seq.workflow.cwl/featureSeqs"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "id": "#index_sim_seq.workflow.cwl/filterSims"
                }, 
                {
                    "type": "string", 
                    "id": "#index_sim_seq.workflow.cwl/jobid"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#index_sim_seq.workflow.cwl/indexSimSeq/output", 
                    "id": "#index_sim_seq.workflow.cwl/indexOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#index_sim_seq.workflow.cwl/sortSimSeq/output", 
                    "id": "#index_sim_seq.workflow.cwl/simSeqOut"
                }
            ], 
            "steps": [
                {
                    "run": "#add_seq2sims.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/sortSims/output", 
                            "valueFrom": "$(self.basename).seq", 
                            "id": "#index_sim_seq.workflow.cwl/addSeq2Sim/outName"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/sortSeqs/file", 
                            "id": "#index_sim_seq.workflow.cwl/addSeq2Sim/sequences"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/sortSims/output", 
                            "id": "#index_sim_seq.workflow.cwl/addSeq2Sim/similarity"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/addSeq2Sim/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/addSeq2Sim"
                }, 
                {
                    "run": "#cat.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/featureSeqs", 
                            "id": "#index_sim_seq.workflow.cwl/catSeqs/files"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).feature.seqs", 
                            "id": "#index_sim_seq.workflow.cwl/catSeqs/outName"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/catSeqs/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/catSeqs"
                }, 
                {
                    "run": "#index_sims_file_md5.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/sortSimSeq/output", 
                            "id": "#index_sim_seq.workflow.cwl/indexSimSeq/input"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/sortSimSeq/output", 
                            "valueFrom": "$(self.basename).index", 
                            "id": "#index_sim_seq.workflow.cwl/indexSimSeq/outName"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/indexSimSeq/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/indexSimSeq"
                }, 
                {
                    "run": "#seqUtil.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/catSeqs/output", 
                            "valueFrom": "$(self.basename).sort.tab", 
                            "id": "#index_sim_seq.workflow.cwl/sortSeqs/output"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/catSeqs/output", 
                            "id": "#index_sim_seq.workflow.cwl/sortSeqs/sequences"
                        }, 
                        {
                            "default": true, 
                            "id": "#index_sim_seq.workflow.cwl/sortSeqs/sortbyid2tab"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/sortSeqs/file"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/sortSeqs"
                }, 
                {
                    "run": "#sort.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/addSeq2Sim/output", 
                            "id": "#index_sim_seq.workflow.cwl/sortSimSeq/input"
                        }, 
                        {
                            "valueFrom": "$([\"2,2\"])", 
                            "id": "#index_sim_seq.workflow.cwl/sortSimSeq/key"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).700.annotation.sims.filter.seq", 
                            "id": "#index_sim_seq.workflow.cwl/sortSimSeq/outName"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/sortSimSeq/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/sortSimSeq"
                }, 
                {
                    "run": "#sort.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/unclusterSims/output", 
                            "id": "#index_sim_seq.workflow.cwl/sortSims/input"
                        }, 
                        {
                            "valueFrom": "$([\"1,1\"])", 
                            "id": "#index_sim_seq.workflow.cwl/sortSims/key"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/unclusterSims/output", 
                            "valueFrom": "$(self.basename).sort", 
                            "id": "#index_sim_seq.workflow.cwl/sortSims/outName"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/sortSims/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/sortSims"
                }, 
                {
                    "run": "#uncluster_sims.tool.cwl", 
                    "in": [
                        {
                            "source": "#index_sim_seq.workflow.cwl/clustMaps", 
                            "id": "#index_sim_seq.workflow.cwl/unclusterSims/clustMap"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).uncluster.sims", 
                            "id": "#index_sim_seq.workflow.cwl/unclusterSims/outName"
                        }, 
                        {
                            "source": "#index_sim_seq.workflow.cwl/filterSims", 
                            "id": "#index_sim_seq.workflow.cwl/unclusterSims/simHit"
                        }
                    ], 
                    "out": [
                        "#index_sim_seq.workflow.cwl/unclusterSims/output"
                    ], 
                    "id": "#index_sim_seq.workflow.cwl/unclusterSims"
                }
            ], 
            "id": "#index_sim_seq.workflow.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "preprocess fastq", 
            "doc": "Remove and trim low quality reads from fastq files. \nReturn fasta files with reads passed and reads removed.\n", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#preprocess-fastq.workflow.cwl/jobid"
                }, 
                {
                    "type": "int", 
                    "default": 5, 
                    "id": "#preprocess-fastq.workflow.cwl/maxLqb"
                }, 
                {
                    "type": "int", 
                    "default": 30, 
                    "id": "#preprocess-fastq.workflow.cwl/minLength"
                }, 
                {
                    "type": "int", 
                    "default": 15, 
                    "id": "#preprocess-fastq.workflow.cwl/minQual"
                }, 
                {
                    "type": "File", 
                    "id": "#preprocess-fastq.workflow.cwl/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#preprocess-fastq.workflow.cwl/passed2fasta/file", 
                    "id": "#preprocess-fastq.workflow.cwl/passed"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#preprocess-fastq.workflow.cwl/removed2fasta/file", 
                    "id": "#preprocess-fastq.workflow.cwl/removed"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#preprocess-fastq.workflow.cwl/adapterTrim/outTrim", 
                    "id": "#preprocess-fastq.workflow.cwl/trimmed"
                }
            ], 
            "steps": [
                {
                    "run": "#autoskewer.tool.cwl", 
                    "in": [
                        {
                            "source": "#preprocess-fastq.workflow.cwl/sequences", 
                            "id": "#preprocess-fastq.workflow.cwl/adapterTrim/input"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).080.adapter.trim.passed.fastq", 
                            "id": "#preprocess-fastq.workflow.cwl/adapterTrim/outName"
                        }
                    ], 
                    "out": [
                        "#preprocess-fastq.workflow.cwl/adapterTrim/outTrim"
                    ], 
                    "id": "#preprocess-fastq.workflow.cwl/adapterTrim"
                }, 
                {
                    "run": "#fastq-mcf.tool.cwl", 
                    "in": [
                        {
                            "source": "#preprocess-fastq.workflow.cwl/adapterTrim/outTrim", 
                            "id": "#preprocess-fastq.workflow.cwl/filter/input"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/maxLqb", 
                            "id": "#preprocess-fastq.workflow.cwl/filter/maxLqb"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/minLength", 
                            "id": "#preprocess-fastq.workflow.cwl/filter/minLength"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/minQual", 
                            "id": "#preprocess-fastq.workflow.cwl/filter/minQual"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).100.preprocess.fastq", 
                            "id": "#preprocess-fastq.workflow.cwl/filter/outName"
                        }
                    ], 
                    "out": [
                        "#preprocess-fastq.workflow.cwl/filter/outTrim", 
                        "#preprocess-fastq.workflow.cwl/filter/outSkip"
                    ], 
                    "id": "#preprocess-fastq.workflow.cwl/filter"
                }, 
                {
                    "run": "#seqUtil.tool.cwl", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#preprocess-fastq.workflow.cwl/passed2fasta/fastq2fasta"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).100.preprocess.passed.fna", 
                            "id": "#preprocess-fastq.workflow.cwl/passed2fasta/output"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/filter/outTrim", 
                            "id": "#preprocess-fastq.workflow.cwl/passed2fasta/sequences"
                        }
                    ], 
                    "out": [
                        "#preprocess-fastq.workflow.cwl/passed2fasta/file"
                    ], 
                    "id": "#preprocess-fastq.workflow.cwl/passed2fasta"
                }, 
                {
                    "run": "#seqUtil.tool.cwl", 
                    "in": [
                        {
                            "default": true, 
                            "id": "#preprocess-fastq.workflow.cwl/removed2fasta/fastq2fasta"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/jobid", 
                            "valueFrom": "$(self).100.preprocess.removed.fna", 
                            "id": "#preprocess-fastq.workflow.cwl/removed2fasta/output"
                        }, 
                        {
                            "source": "#preprocess-fastq.workflow.cwl/filter/outSkip", 
                            "id": "#preprocess-fastq.workflow.cwl/removed2fasta/sequences"
                        }
                    ], 
                    "out": [
                        "#preprocess-fastq.workflow.cwl/removed2fasta/file"
                    ], 
                    "id": "#preprocess-fastq.workflow.cwl/removed2fasta"
                }
            ], 
            "id": "#preprocess-fastq.workflow.cwl"
        }, 
        {
            "class": "Workflow", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#qc-basic.workflow.cwl/jobid"
                }, 
                {
                    "type": [
                        "null", 
                        {
                            "type": "array", 
                            "items": "int"
                        }
                    ], 
                    "default": [
                        6
                    ], 
                    "id": "#qc-basic.workflow.cwl/kmerLength"
                }, 
                {
                    "type": "File", 
                    "id": "#qc-basic.workflow.cwl/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#qc-basic.workflow.cwl/formatQcStats/stats", 
                    "id": "#qc-basic.workflow.cwl/qcStatFile"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qc-basic.workflow.cwl/formatQcStats/summary", 
                    "id": "#qc-basic.workflow.cwl/qcSummaryFile"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qc-basic.workflow.cwl/formatSequenceStats/bins", 
                    "id": "#qc-basic.workflow.cwl/seqBinFile"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#qc-basic.workflow.cwl/formatSequenceStats/stats", 
                    "id": "#qc-basic.workflow.cwl/seqStatFile"
                }
            ], 
            "steps": [
                {
                    "run": "#consensus.tool.cwl", 
                    "in": [
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.consensus.stats", 
                            "id": "#qc-basic.workflow.cwl/consensus/output"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequences", 
                            "id": "#qc-basic.workflow.cwl/consensus/sequences"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequenceStats/statOut", 
                            "id": "#qc-basic.workflow.cwl/consensus/stats"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/consensus/summary", 
                        "#qc-basic.workflow.cwl/consensus/consensus"
                    ], 
                    "id": "#qc-basic.workflow.cwl/consensus"
                }, 
                {
                    "run": "#drisee.tool.cwl", 
                    "in": [
                        {
                            "source": "#qc-basic.workflow.cwl/sequences", 
                            "id": "#qc-basic.workflow.cwl/drisee/sequences"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/drisee/info", 
                        "#qc-basic.workflow.cwl/drisee/stats"
                    ], 
                    "id": "#qc-basic.workflow.cwl/drisee"
                }, 
                {
                    "run": "#format_qc_stats.tool.cwl", 
                    "in": [
                        {
                            "source": "#qc-basic.workflow.cwl/consensus/consensus", 
                            "id": "#qc-basic.workflow.cwl/formatQcStats/consensus"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/drisee/info", 
                            "id": "#qc-basic.workflow.cwl/formatQcStats/driseeInfo"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/drisee/stats", 
                            "id": "#qc-basic.workflow.cwl/formatQcStats/driseeStat"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/kmer/stats", 
                            "id": "#qc-basic.workflow.cwl/formatQcStats/kmer"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.qc", 
                            "id": "#qc-basic.workflow.cwl/formatQcStats/outPrefix"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/formatQcStats/stats", 
                        "#qc-basic.workflow.cwl/formatQcStats/summary"
                    ], 
                    "id": "#qc-basic.workflow.cwl/formatQcStats"
                }, 
                {
                    "run": "#format_seq_stats.tool.cwl", 
                    "in": [
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.qc", 
                            "id": "#qc-basic.workflow.cwl/formatSequenceStats/output_prefix"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequenceStats/gcBinOut", 
                            "id": "#qc-basic.workflow.cwl/formatSequenceStats/sequence_gc"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequenceStats/lenBinOut", 
                            "id": "#qc-basic.workflow.cwl/formatSequenceStats/sequence_lengths"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequenceStats/statOut", 
                            "id": "#qc-basic.workflow.cwl/formatSequenceStats/sequence_stats"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/formatSequenceStats/stats", 
                        "#qc-basic.workflow.cwl/formatSequenceStats/bins"
                    ], 
                    "id": "#qc-basic.workflow.cwl/formatSequenceStats"
                }, 
                {
                    "run": "#kmer-tool.tool.cwl", 
                    "scatter": "#qc-basic.workflow.cwl/kmer/length", 
                    "scatterMethod": "dotproduct", 
                    "in": [
                        {
                            "valueFrom": "histo", 
                            "id": "#qc-basic.workflow.cwl/kmer/format"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/kmerLength", 
                            "id": "#qc-basic.workflow.cwl/kmer/length"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075", 
                            "id": "#qc-basic.workflow.cwl/kmer/prefix"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequences", 
                            "id": "#qc-basic.workflow.cwl/kmer/sequences"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/kmer/stats"
                    ], 
                    "id": "#qc-basic.workflow.cwl/kmer"
                }, 
                {
                    "run": "#seq_length_stats.tool.cwl", 
                    "in": [
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.gc.bin", 
                            "id": "#qc-basic.workflow.cwl/sequenceStats/gcBin"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.length.bin", 
                            "id": "#qc-basic.workflow.cwl/sequenceStats/lenBin"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/jobid", 
                            "valueFrom": "$(self).075.seq.stats", 
                            "id": "#qc-basic.workflow.cwl/sequenceStats/outName"
                        }, 
                        {
                            "source": "#qc-basic.workflow.cwl/sequences", 
                            "id": "#qc-basic.workflow.cwl/sequenceStats/sequences"
                        }
                    ], 
                    "out": [
                        "#qc-basic.workflow.cwl/sequenceStats/statOut", 
                        "#qc-basic.workflow.cwl/sequenceStats/lenBinOut", 
                        "#qc-basic.workflow.cwl/sequenceStats/gcBinOut"
                    ], 
                    "id": "#qc-basic.workflow.cwl/sequenceStats"
                }
            ], 
            "id": "#qc-basic.workflow.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "rna annotation", 
            "doc": "RNAs - predict, cluster, identify, annotate", 
            "requirements": [
                {
                    "class": "StepInputExpressionRequirement"
                }, 
                {
                    "class": "InlineJavascriptRequirement"
                }, 
                {
                    "class": "ScatterFeatureRequirement"
                }, 
                {
                    "class": "MultipleInputFeatureRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "string", 
                    "id": "#rna-annotation.workflow.cwl/jobid"
                }, 
                {
                    "type": "File", 
                    "id": "#rna-annotation.workflow.cwl/m5nrBDB"
                }, 
                {
                    "type": "File", 
                    "id": "#rna-annotation.workflow.cwl/m5rnaClust"
                }, 
                {
                    "type": "File", 
                    "id": "#rna-annotation.workflow.cwl/m5rnaFull"
                }, 
                {
                    "type": "Directory", 
                    "id": "#rna-annotation.workflow.cwl/m5rnaIndex"
                }, 
                {
                    "type": "string", 
                    "id": "#rna-annotation.workflow.cwl/m5rnaPrefix"
                }, 
                {
                    "type": [
                        "null", 
                        "float"
                    ], 
                    "default": 0.97, 
                    "id": "#rna-annotation.workflow.cwl/rnaIdentity"
                }, 
                {
                    "type": "File", 
                    "id": "#rna-annotation.workflow.cwl/sequences"
                }
            ], 
            "outputs": [
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/formatCluster/output", 
                    "id": "#rna-annotation.workflow.cwl/rnaClustMapOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/rnaCluster/outSeq", 
                    "id": "#rna-annotation.workflow.cwl/rnaClustSeqOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/annotateSims/outExpand", 
                    "id": "#rna-annotation.workflow.cwl/rnaExpandOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/rnaFeature/output", 
                    "id": "#rna-annotation.workflow.cwl/rnaFeatureOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/annotateSims/outFilter", 
                    "id": "#rna-annotation.workflow.cwl/rnaFilterOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/annotateSims/outLca", 
                    "id": "#rna-annotation.workflow.cwl/rnaLCAOut"
                }, 
                {
                    "type": "File", 
                    "outputSource": "#rna-annotation.workflow.cwl/bleachSims/output", 
                    "id": "#rna-annotation.workflow.cwl/rnaSimsOut"
                }
            ], 
            "steps": [
                {
                    "run": "#sims_annotate.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/m5nrBDB", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/database"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/bleachSims/output", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/input"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).450.rna.expand.rna", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/outExpandName"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).450.rna.sims.filter", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/outFilterName"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).450.rna.expand.lca", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/outLcaName"
                        }, 
                        {
                            "valueFrom": "rna", 
                            "id": "#rna-annotation.workflow.cwl/annotateSims/seqFormat"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/annotateSims/outFilter", 
                        "#rna-annotation.workflow.cwl/annotateSims/outExpand", 
                        "#rna-annotation.workflow.cwl/annotateSims/outLca"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/annotateSims"
                }, 
                {
                    "run": "#bleachsims.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/rnaBlat/output", 
                            "id": "#rna-annotation.workflow.cwl/bleachSims/input"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).450.rna.sims", 
                            "id": "#rna-annotation.workflow.cwl/bleachSims/outName"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/bleachSims/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/bleachSims"
                }, 
                {
                    "run": "#format_cluster.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/rnaCluster/outClstr", 
                            "id": "#rna-annotation.workflow.cwl/formatCluster/input"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).440.cluster.rna97.mapping", 
                            "id": "#rna-annotation.workflow.cwl/formatCluster/outName"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/formatCluster/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/formatCluster"
                }, 
                {
                    "run": "#blat.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/m5rnaFull", 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/database"
                        }, 
                        {
                            "valueFrom": "dna", 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/dbType"
                        }, 
                        {
                            "default": true, 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/fastMap"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).450.rna.sims.full", 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/outName"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/rnaCluster/outSeq", 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/query"
                        }, 
                        {
                            "valueFrom": "rna", 
                            "id": "#rna-annotation.workflow.cwl/rnaBlat/queryType"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/rnaBlat/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/rnaBlat"
                }, 
                {
                    "run": "#cdhit-est.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/rnaIdentity", 
                            "id": "#rna-annotation.workflow.cwl/rnaCluster/identity"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/rnaFeature/output", 
                            "id": "#rna-annotation.workflow.cwl/rnaCluster/input"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).440.cluster.rna97.fna", 
                            "id": "#rna-annotation.workflow.cwl/rnaCluster/outName"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/rnaCluster/outSeq", 
                        "#rna-annotation.workflow.cwl/rnaCluster/outClstr"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/rnaCluster"
                }, 
                {
                    "run": "#rna_feature.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/sorttab/output", 
                            "id": "#rna-annotation.workflow.cwl/rnaFeature/aligned"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/jobid", 
                            "valueFrom": "$(self).425.search.rna.fna", 
                            "id": "#rna-annotation.workflow.cwl/rnaFeature/outName"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/sortseq/file", 
                            "id": "#rna-annotation.workflow.cwl/rnaFeature/sequence"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/rnaFeature/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/rnaFeature"
                }, 
                {
                    "run": "#sortmerna.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/m5rnaIndex", 
                            "id": "#rna-annotation.workflow.cwl/sortmerna/indexDir"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/m5rnaPrefix", 
                            "id": "#rna-annotation.workflow.cwl/sortmerna/indexName"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/sequences", 
                            "id": "#rna-annotation.workflow.cwl/sortmerna/input"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/m5rnaClust", 
                            "id": "#rna-annotation.workflow.cwl/sortmerna/refFasta"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/sortmerna/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/sortmerna"
                }, 
                {
                    "run": "#seqUtil.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/sequences", 
                            "valueFrom": "$(self.basename).sort.tab", 
                            "id": "#rna-annotation.workflow.cwl/sortseq/output"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/sequences", 
                            "id": "#rna-annotation.workflow.cwl/sortseq/sequences"
                        }, 
                        {
                            "default": true, 
                            "id": "#rna-annotation.workflow.cwl/sortseq/sortbyid2tab"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/sortseq/file"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/sortseq"
                }, 
                {
                    "run": "#sort.tool.cwl", 
                    "in": [
                        {
                            "source": "#rna-annotation.workflow.cwl/sortmerna/output", 
                            "id": "#rna-annotation.workflow.cwl/sorttab/input"
                        }, 
                        {
                            "valueFrom": "$([\"1,1\"])", 
                            "id": "#rna-annotation.workflow.cwl/sorttab/key"
                        }, 
                        {
                            "source": "#rna-annotation.workflow.cwl/sortmerna/output", 
                            "valueFrom": "$(self.basename).sort", 
                            "id": "#rna-annotation.workflow.cwl/sorttab/outName"
                        }
                    ], 
                    "out": [
                        "#rna-annotation.workflow.cwl/sorttab/output"
                    ], 
                    "id": "#rna-annotation.workflow.cwl/sorttab"
                }
            ], 
            "id": "#rna-annotation.workflow.cwl"
        }
    ]
}