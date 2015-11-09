#ifndef COM_GSCHAT_GSCHAT_GS
#define COM_GSCHAT_GSCHAT_GS
#import <com/gsrpc/channel.h>

#import <com/gschat/shared.gs.h>



#import <com/gsrpc/stream.h>

#import <com/gsrpc/gsrpc.gs.h>





//GSChatClient generate by objrpc
@protocol GSChatClient<NSObject>

- (void) Push:(GSChatMail*)arg0;

- (void) Notify:(UInt32)arg0;

- (void) DeviceStateChanged:(GSDevice*)arg0 withArg1:(BOOL)arg1;

@end

// GSChatClientService generate by objrpc
@interface GSChatClientService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatClient>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatClientRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (NSError*) Push:(GSChatMail*) arg0 ;

- (NSError*) Notify:(UInt32) arg0 ;

- (NSError*) DeviceStateChanged:(GSDevice*) arg0  withArg1:(BOOL) arg1 ;

@end



//GSChatMailHub generate by objrpc
@protocol GSChatMailHub<NSObject>

- (UInt32) PutSync;

- (UInt64) Put:(GSChatMail*)arg0;

- (UInt32) Sync:(UInt32)arg0 withArg1:(UInt32)arg1;

- (void) Fin:(UInt32)arg0;

@end

// GSChatMailHubService generate by objrpc
@interface GSChatMailHubService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatMailHub>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatMailHubRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) PutSync;

- (id<GSPromise>) Put:(GSChatMail*) arg0 ;

- (id<GSPromise>) Sync:(UInt32) arg0  withArg1:(UInt32) arg1 ;

- (id<GSPromise>) Fin:(UInt32) arg0 ;

@end



//GSChatAuth generate by objrpc
@protocol GSChatAuth<NSObject>

- (NSMutableArray *) Login:(NSString*)arg0 withArg1:(NSMutableArray *)arg1;

- (void) Logoff:(NSMutableArray *)arg0;

@end

// GSChatAuthService generate by objrpc
@interface GSChatAuthService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatAuth>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatAuthRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Login:(NSString*) arg0  withArg1:(NSMutableArray *) arg1 ;

- (id<GSPromise>) Logoff:(NSMutableArray *) arg0 ;

@end



//GSChatPush generate by objrpc
@protocol GSChatPush<NSObject>

- (void) Register:(NSMutableData *)arg0;

- (void) Unregister;

@end

// GSChatPushService generate by objrpc
@interface GSChatPushService : NSObject<GSDispatcher>
+ (instancetype) init:(id<GSChatPush>)service withID:(UInt16) serviceID;

@property(readonly) UInt16 ID;

- (GSResponse *)Dispatch:(GSRequest *)call;

@end


@interface GSChatPushRPC : NSObject
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID;

- (id<GSPromise>) Register:(NSMutableData *) arg0 ;

- (id<GSPromise>) Unregister;

@end


#endif //COM_GSCHAT_GSCHAT_GS
