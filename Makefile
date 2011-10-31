# Create the predict.h file with something like:
# char *predictpath={"/Users/chris/Projects/hq/smd/sattrack/predict-2.2.3/"}, soundcard=0, *version={"2.2.3"};
# TODO:
# - Install to /usr/local/... by default
# - Punting on soundcard and vocalizer for mac

default: predict

predict.h:
	echo "char *predictpath = {\"`pwd`\"};" > predict.h
	echo "char soundcard = 0;" >> predict.h
	echo "char *version = {\"`cat .version`\"};" >> predict.h


predict: predict.c predict.h
	cc -Wall -fomit-frame-pointer -lm -lncurses -pthread predict.c -o predict



# There's a 'clean' script that I don't know enough about yet
myclean:
	echo "Removing installer predict.h predict..."
	rm -f installer predict.h predict

