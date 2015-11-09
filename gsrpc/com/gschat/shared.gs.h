#ifndef COM_GSCHAT_SHARED_GS
#define COM_GSCHAT_SHARED_GS
#import <com/gsrpc/channel.h>

#import <com/gsrpc/stream.h>


typedef enum GSChatMailType:UInt8 GSChatMailType;

@class GSChatUserAuthFailed;

@class GSChatResourceNotFound;

typedef enum GSChatService:UInt8 GSChatService;

@class GSChatAttachment;

@class GSChatAttachmentCMD;

@class GSChatUserNotFound;

@class GSChatAttachmentVideo;

@class GSChatResourceBusy;

@class GSChatMail;

typedef enum GSChatAttachmentType:UInt8 GSChatAttachmentType;

@class GSChatAttachmentText;

@class GSChatUnexpectSQID;

@class GSChatAttachmentGPS;

@class GSChatAttachmentImage;

@class GSChatAttachmentAudio;


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



@interface GSChatUserAuthFailed : NSObject

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



// GSChatService enum
enum GSChatService:UInt8{ 
	GSChatServiceUnknown = 1,
	GSChatServiceMailHub = 2,
	GSChatServicePush = 3,
	GSChatServiceAuth = 4,
	GSChatServiceClient = 5,
	GSChatServiceUserBinder = 6,
	GSChatServicePushServiceProvider = 7,
	GSChatServiceDHKeyResolver = 8
 };

// GSChatService enum marshal/unmarshal helper interface
@interface GSChatServiceHelper : NSObject
+ (void) marshal:(GSChatService) val withWriter:(id<GSWriter>) writer;
+ (GSChatService) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSChatService)val;
@end



@interface GSChatAttachment : NSObject

@property GSChatAttachmentType Type;

@property(nonatomic, strong) NSMutableData * Content;

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



@interface GSChatUserNotFound : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



@interface GSChatAttachmentVideo : NSObject

@property(nonatomic, strong) NSString* Key;

@property(nonatomic, strong) NSString* Name;

@property SInt16 Duration;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatResourceBusy : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



@interface GSChatMail : NSObject

@property UInt64 ID;

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



@interface GSChatAttachmentText : NSObject

@property(nonatomic, strong) NSString* Text;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSChatUnexpectSQID : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

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


#endif //COM_GSCHAT_SHARED_GS
