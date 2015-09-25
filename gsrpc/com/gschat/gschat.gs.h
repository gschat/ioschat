#ifndef COM_GSCHAT_GSCHAT_GS
#define COM_GSCHAT_GSCHAT_GS
#import <com/gsrpc/channel.h>

#import <com/gsrpc/stream.h>


typedef enum GSMailType:UInt8 GSMailType;

@class GSUserNotFound;

@class GSUserAuthFailed;

typedef enum GSServiceType:UInt8 GSServiceType;

@class GSProperty;

@class GSMail;

@class GSAttachment;

typedef enum GSAttachmentType:UInt8 GSAttachmentType;


// GSMailType enum
enum GSMailType:UInt8{ 
	GSMailTypeSingle = 0,
	GSMailTypeMulti = 1,
	GSMailTypeSystem = 2
 };

// GSMailType enum marshal/unmarshal helper interface
@interface GSMailTypeHelper : NSObject
+ (void) marshal:(GSMailType) val withWriter:(id<GSWriter>) writer;
+ (GSMailType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSMailType)val;
@end



@interface GSUserNotFound : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
- (NSError*) asNSError;
@end



@interface GSUserAuthFailed : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
- (NSError*) asNSError;
@end



// GSServiceType enum
enum GSServiceType:UInt8{ 
	GSServiceTypeUnknown = 0,
	GSServiceTypeIM = 1,
	GSServiceTypeANPS = 2,
	GSServiceTypeAuth = 3,
	GSServiceTypeClient = 4
 };

// GSServiceType enum marshal/unmarshal helper interface
@interface GSServiceTypeHelper : NSObject
+ (void) marshal:(GSServiceType) val withWriter:(id<GSWriter>) writer;
+ (GSServiceType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSServiceType)val;
@end



// GSProperty generated by objrpc tools
@interface GSProperty : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Value;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



//GSIMAuth generate by objrpc
@protocol GSIMAuth<NSObject>

- (NSMutableArray *) Login:(NSString*)arg0 withArg1:(NSMutableArray *)arg1;

- (void) Logoff:(NSMutableArray *)arg0;

@end

// GSIMAuthService generate by objrpc
@interface GSIMAuthService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSIMAuth>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSIMAuthRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Login:(NSString*) arg0  withArg1:(NSMutableArray *) arg1 ;

- (id<GSPromise>) Logoff:(NSMutableArray *) arg0 ;

@end



// GSMail generated by objrpc tools
@interface GSMail : NSObject

@property UInt32 SQID;

@property UInt64 TS;

@property(nonatomic, strong) NSString* Sender;

@property(nonatomic, strong) NSString* Receiver;

@property GSMailType Type;

@property(nonatomic, strong) NSString* Content;

@property(nonatomic, strong) NSMutableArray * Attachments;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



// GSAttachment generated by objrpc tools
@interface GSAttachment : NSObject

@property GSAttachmentType Type;

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



//GSIMClient generate by objrpc
@protocol GSIMClient<NSObject>

- (void) Push:(GSMail*)arg0;

- (void) Notify:(UInt32)arg0;

@end

// GSIMClientService generate by objrpc
@interface GSIMClientService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSIMClient>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSIMClientRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Push:(GSMail*) arg0 ;

- (id<GSPromise>) Notify:(UInt32) arg0 ;

@end



// GSAttachmentType enum
enum GSAttachmentType:UInt8{ 
	GSAttachmentTypeText = 0,
	GSAttachmentTypeImage = 1,
	GSAttachmentTypeVideo = 2,
	GSAttachmentTypeAudio = 3,
	GSAttachmentTypeGPS = 4,
	GSAttachmentTypeCustomer = 5
 };

// GSAttachmentType enum marshal/unmarshal helper interface
@interface GSAttachmentTypeHelper : NSObject
+ (void) marshal:(GSAttachmentType) val withWriter:(id<GSWriter>) writer;
+ (GSAttachmentType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSAttachmentType)val;
@end



//GSIMServer generate by objrpc
@protocol GSIMServer<NSObject>

- (UInt64) Put:(GSMail*)arg0;

- (void) Pull:(UInt32)arg0;

@end

// GSIMServerService generate by objrpc
@interface GSIMServerService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSIMServer>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSIMServerRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Put:(GSMail*) arg0 ;

- (id<GSPromise>) Pull:(UInt32) arg0 ;

@end


#endif //COM_GSCHAT_GSCHAT_GS
