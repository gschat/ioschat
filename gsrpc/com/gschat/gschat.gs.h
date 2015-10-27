#ifndef COM_GSCHAT_GSCHAT_GS
#define COM_GSCHAT_GSCHAT_GS
#import <com/gsrpc/channel.h>

#import <com/gsrpc/stream.h>


@class GSChatMail;

@class GSChatAttachment;

typedef enum GSChatAttachmentType:UInt8 GSChatAttachmentType;

@class GSChatUserAuthFailed;

@class GSChatAttachmentVideo;

@class GSChatAttachmentCMD;

typedef enum GSChatMailType:UInt8 GSChatMailType;

@class GSChatAttachmentText;

@class GSChatAttachmentGPS;

@class GSChatAttachmentImage;

@class GSChatAttachmentAudio;

@class GSChatUserNotFound;

@class GSChatResourceNotFound;

@class GSChatUnexpectSQID;

typedef enum GSChatServiceType:UInt8 GSChatServiceType;

@class GSChatProperty;


@interface GSChatMail : NSObject

@property(nonatomic, strong) NSString* MailID;

@property UInt32 SQID;

@property UInt64 TS;

@property(nonatomic, strong) NSString* Sender;

@property(nonatomic, strong) NSString* Receiver;

@property GSChatMailType Type;

@property(nonatomic, strong) NSString* Content;

@property(nonatomic, strong) NSMutableArray * Attachments;

@property(nonatomic, strong) NSMutableData * Extension;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatAttachment : NSObject

@property GSChatAttachmentType Type;

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



// GSChatAttachmentType enum
enum GSChatAttachmentType:UInt8{ 
	GSChatAttachmentTypeText = 0,
	GSChatAttachmentTypeImage = 1,
	GSChatAttachmentTypeVideo = 2,
	GSChatAttachmentTypeAudio = 3,
	GSChatAttachmentTypeGPS = 4,
	GSChatAttachmentTypeCMD = 5,
	GSChatAttachmentTypeCustomer = 6
 };

// GSChatAttachmentType enum marshal/unmarshal helper interface
@interface GSChatAttachmentTypeHelper : NSObject
+ (void) marshal:(GSChatAttachmentType) val withWriter:(id<GSWriter>) writer;
+ (GSChatAttachmentType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSChatAttachmentType)val;
@end



@interface GSChatUserAuthFailed : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



//GSChatIMServer generate by objrpc
@protocol GSChatIMServer<NSObject>

- (UInt32) Prepare;

- (UInt64) Put:(GSChatMail*)arg0;

- (UInt32) Sync:(UInt32)arg0 withArg1:(UInt32)arg1;

@end

// GSChatIMServerService generate by objrpc
@interface GSChatIMServerService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatIMServer>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatIMServerRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Prepare;

- (id<GSPromise>) Put:(GSChatMail*) arg0 ;

- (id<GSPromise>) Sync:(UInt32) arg0  withArg1:(UInt32) arg1 ;

@end



@interface GSChatAttachmentVideo : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Name;

@property SInt16 Duration;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatAttachmentCMD : NSObject

@property(nonatomic, strong) NSString* Command;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



// GSChatMailType enum
enum GSChatMailType:UInt8{ 
	GSChatMailTypeSingle = 0,
	GSChatMailTypeMulti = 1,
	GSChatMailTypeSystem = 2
 };

// GSChatMailType enum marshal/unmarshal helper interface
@interface GSChatMailTypeHelper : NSObject
+ (void) marshal:(GSChatMailType) val withWriter:(id<GSWriter>) writer;
+ (GSChatMailType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSChatMailType)val;
@end



//GSChatIMClient generate by objrpc
@protocol GSChatIMClient<NSObject>

- (void) Push:(GSChatMail*)arg0;

- (void) Notify:(UInt32)arg0;

@end

// GSChatIMClientService generate by objrpc
@interface GSChatIMClientService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatIMClient>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatIMClientRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (NSError*) Push:(GSChatMail*) arg0 ;

- (id<GSPromise>) Notify:(UInt32) arg0 ;

@end



@interface GSChatAttachmentText : NSObject

@property(nonatomic, strong) NSString* Text;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatAttachmentGPS : NSObject

@property Float64 Longitude;

@property Float64 Latitude;

@property(nonatomic, strong) NSString* Address;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatAttachmentImage : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Name;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatAttachmentAudio : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Name;

@property SInt16 Duration;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatUserNotFound : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



@interface GSChatResourceNotFound : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



@interface GSChatUnexpectSQID : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



//GSChatIMAuth generate by objrpc
@protocol GSChatIMAuth<NSObject>

- (NSMutableArray *) Login:(NSString*)arg0 withArg1:(NSMutableArray *)arg1;

- (void) Logoff:(NSMutableArray *)arg0;

@end

// GSChatIMAuthService generate by objrpc
@interface GSChatIMAuthService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatIMAuth>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatIMAuthRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Login:(NSString*) arg0  withArg1:(NSMutableArray *) arg1 ;

- (id<GSPromise>) Logoff:(NSMutableArray *) arg0 ;

@end



//GSChatIMPush generate by objrpc
@protocol GSChatIMPush<NSObject>

- (void) Register:(NSMutableData *)arg0;

- (void) Unregister;

@end

// GSChatIMPushService generate by objrpc
@interface GSChatIMPushService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatIMPush>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatIMPushRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Register:(NSMutableData *) arg0 ;

- (id<GSPromise>) Unregister;

@end



// GSChatServiceType enum
enum GSChatServiceType:UInt8{ 
	GSChatServiceTypeUnknown = 0,
	GSChatServiceTypeIM = 1,
	GSChatServiceTypePush = 2,
	GSChatServiceTypeAuth = 3,
	GSChatServiceTypeClient = 4,
	GSChatServiceTypeStatus = 5
 };

// GSChatServiceType enum marshal/unmarshal helper interface
@interface GSChatServiceTypeHelper : NSObject
+ (void) marshal:(GSChatServiceType) val withWriter:(id<GSWriter>) writer;
+ (GSChatServiceType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSChatServiceType)val;
@end



@interface GSChatProperty : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Value;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end


#endif //COM_GSCHAT_GSCHAT_GS
