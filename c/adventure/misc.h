typedef enum
{
    distPlayer,
    distHeld,
    distHeldContained,
    distLocation,
    distHere,
    distHereContained,
    distOverThere,
    distNotHere,
    distUnknownObject,
    distNoObjectSpecified
} DISTANCE;

extern OBJECT *getPassageTo(OBJECT *targetLocation);
extern DISTANCE distanceTo(OBJECT *obj);
extern OBJECT *parseObject(const char *noun);
extern OBJECT *personHere(void);
extern int listObjectsAtLocation(OBJECT *location);
extern int weightOfContents(OBJECT *container);