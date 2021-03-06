#! /usr/bin/env sh

DBDIR=$1

if [ $# -eq 0 ]; then
    DBDIR="."
elif [ ! -d $DBDIR ]; then
    DBDIR="."
fi

SHOCK="http://shock.metagenomics.anl.gov/node"

echo "Downloading DB data to $DBDIR"
`curl "$SHOCK/66fe2976-80fd-4d67-a5cd-051018c49c2b?download" > $DBDIR/e_coli.1.bt2`
`curl "$SHOCK/d0eb4784-2f4a-4093-8731-5fe158365036?download" > $DBDIR/e_coli.2.bt2`
`curl "$SHOCK/75acfaea-bc42-4f02-a014-cdff9f025e2e?download" > $DBDIR/e_coli.3.bt2`
`curl "$SHOCK/f85b745c-0bea-4bac-9fa4-530411f3bc1c?download" > $DBDIR/e_coli.4.bt2`
`curl "$SHOCK/94e7b176-034f-4297-957e-cbcaa7cbc583?download" > $DBDIR/e_coli.rev.1.bt2`
`curl "$SHOCK/d0e023b1-7ada-4d10-beda-9db9a681ed57?download" > $DBDIR/e_coli.rev.2.bt2`

`curl "$SHOCK/12c7a5dc-7859-43cb-a7a0-42a7d2ec3d29?download" > $DBDIR/h_sapiens.1.bt2`
`curl "$SHOCK/87eeeac0-b3df-4872-9a71-8f5a984a78f0?download" > $DBDIR/h_sapiens.2.bt2`
`curl "$SHOCK/ea8914ab-7425-401f-9a86-5e10210e10b4?download" > $DBDIR/h_sapiens.3.bt2`
`curl "$SHOCK/95da2457-d214-4357-b039-47ef84387ae6?download" > $DBDIR/h_sapiens.4.bt2`
`curl "$SHOCK/88a60d6f-8281-4b77-b86e-c8ca8b21b049?download" > $DBDIR/h_sapiens.rev.1.bt2`
`curl "$SHOCK/bd6a2f1d-87fb-42eb-a1ce-fb506b8da65a?download" > $DBDIR/h_sapiens.rev.2.bt2`

`curl "$SHOCK/1284813a-91d1-42b1-bc72-e74f19e1a0d1?download" > $DBDIR/md5rna`
`curl "$SHOCK/c4c76c22-297b-4404-af5c-8cd98e580f2a?download" > $DBDIR/md5rna.clust`
`curl "$SHOCK/1a6768c2-b03a-4bd9-83aa-176266bbc742?download" > $DBDIR/m5rna.clust.index.bursttrie_0.dat`
`curl "$SHOCK/61cd91d8-c124-4a53-9b65-8cd87f88aa32?download" > $DBDIR/m5rna.clust.index.kmer_0.dat`
`curl "$SHOCK/5190f16f-1bbc-44ba-a226-47add7889b0a?download" > $DBDIR/m5rna.clust.index.pos_0.dat`
`curl "$SHOCK/266a5154-7a06-4813-b948-0524155c71ec?download" > $DBDIR/m5rna.clust.index.stats`

`curl "$SHOCK/524aec48-6c6f-4ad1-8f45-cfd39d1b9060?download" > $DBDIR/scg_md5.json`
`curl "$SHOCK/e5dc6081-e289-4445-9617-b53fdc4023a8?download" > $DBDIR/m5nr_v1.bdb`
`curl "$SHOCK/4406405c-526c-4a63-be22-04b7c2d18434?download" > $DBDIR/md5nr.1`
`curl "$SHOCK/65d644a8-55a5-439f-a8b5-af1440472d8d?download" > $DBDIR/md5nr.2`

`curl "$SHOCK/edd8ef09-d746-4736-a6a0-6a83208df7a1?download" > $DBDIR/m5nr_v1.taxonomy.map.json`
`curl "$SHOCK/2a7e0d4d-a581-40ab-a989-53eca51e24a9?download" > $DBDIR/m5nr_v1.ontology.map.json`

echo "Done"
