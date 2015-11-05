#import <com/gschat/gschat.gs.h>

#import <com/gsrpc/gsrpc.gs.h>




@implementation GSChatMailHubService{
    id<GSChatMailHub> _service;
}
+ (instancetype) init:(id<GSChatMailHub>)service withID:(UInt16) serviceID {
    return [[GSChatMailHubService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatMailHub>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
        case 0:{

            UInt32 ret =  [ _service PutSync];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt32 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 1:{
			GSChatMail* arg0 = [[GSChatMail alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				[arg0 unmarshal:reader ];
			}


            UInt64 ret = [ _service Put: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt64 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 2:{
			UInt32 arg0 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadUInt32];
			}

			UInt32 arg1 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

				arg1 = [reader ReadUInt32];
			}


            UInt32 ret = [ _service Sync: arg0  withArg1:arg1 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt32 :ret];
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 3:{
			UInt32 arg0 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadUInt32];
			}


            [ _service Fin: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
            return callreturn;
            
        }
    
    }
    return nil;
}

@end


@implementation GSChatMailHubRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatMailHubRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) PutSync{
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt32 callreturn = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt32];
		}


        return ((id<GSPromise>(^)(UInt32))block)(callreturn);;
    });
    
}

- (id<GSPromise>) Put:(GSChatMail*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg0 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt64 callreturn = (UInt64)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt64];
		}


        return ((id<GSPromise>(^)(UInt64))block)(callreturn);;
    });
    
}

- (id<GSPromise>) Sync:(UInt32) arg0  withArg1:(UInt32) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)2;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg1];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt32 callreturn = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt32];
		}


        return ((id<GSPromise>(^)(UInt32))block)(callreturn);;
    });
    
}

- (id<GSPromise>) Fin:(UInt32) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)3;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
}

@end






@implementation GSChatAuthService{
    id<GSChatAuth> _service;
}
+ (instancetype) init:(id<GSChatAuth>)service withID:(UInt16) serviceID {
    return [[GSChatAuthService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatAuth>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
        case 0:{
			NSString* arg0 = @"";

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadString];
			}

			NSMutableArray * arg1 = [NSMutableArray arrayWithCapacity: 0];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

				UInt16 imax4 = [reader ReadUInt16];

				for(UInt16 i4 = 0; i4 < imax4; i4 ++ ){

					GSKV* v4 = [[GSKV alloc] init];

					[v4 unmarshal:reader ];

					[ arg1 addObject: v4];

				}
			}


            NSMutableArray * ret = [ _service Login: arg0  withArg1:arg1 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt16:ret.count];
			for(id v3 in ret){
				GSKV* vv3 = (GSKV*)v3;
				[vv3 marshal: writer];
			}
			callreturn.Content = writer.content;

		}


            
            return callreturn;
            
        }
    
        case 1:{
			NSMutableArray * arg0 = [NSMutableArray arrayWithCapacity: 0];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				UInt16 imax4 = [reader ReadUInt16];

				for(UInt16 i4 = 0; i4 < imax4; i4 ++ ){

					GSKV* v4 = [[GSKV alloc] init];

					[v4 unmarshal:reader ];

					[ arg0 addObject: v4];

				}
			}


            [ _service Logoff: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
            return callreturn;
            
        }
    
    }
    return nil;
}

@end


@implementation GSChatAuthRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatAuthRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Login:(NSString*) arg0  withArg1:(NSMutableArray *) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt16:arg1.count];
		for(id v2 in arg1){
			GSKV* vv2 = (GSKV*)v2;
			[vv2 marshal: writer];
		}
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		NSMutableArray * callreturn = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSKV* v3 = [[GSKV alloc] init];

				[v3 unmarshal:reader ];

				[ callreturn addObject: v3];

			}
		}


        return ((id<GSPromise>(^)(NSMutableArray *))block)(callreturn);;
    });
    
}

- (id<GSPromise>) Logoff:(NSMutableArray *) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt16:arg0.count];
		for(id v2 in arg0){
			GSKV* vv2 = (GSKV*)v2;
			[vv2 marshal: writer];
		}
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
}

@end






@implementation GSChatPushService{
    id<GSChatPush> _service;
}
+ (instancetype) init:(id<GSChatPush>)service withID:(UInt16) serviceID {
    return [[GSChatPushService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatPush>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
        case 0:{
			NSMutableData * arg0 = [[NSMutableData alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadBytes];
			}


            [ _service Register: arg0 ];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
            return callreturn;
            
        }
    
        case 1:{

             [ _service Unregister];
            
            GSResponse * callreturn  = [GSResponse init];
            callreturn.ID = call.ID;
            
            return callreturn;
            
        }
    
    }
    return nil;
}

@end


@implementation GSChatPushRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatPushRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Register:(NSMutableData *) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteBytes: arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
}

- (id<GSPromise>) Unregister{
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    

    
    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
    
}

@end






@implementation GSChatClientService{
    id<GSChatClient> _service;
}
+ (instancetype) init:(id<GSChatClient>)service withID:(UInt16) serviceID {
    return [[GSChatClientService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSChatClient>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
        case 0:{
			GSChatMail* arg0 = [[GSChatMail alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				[arg0 unmarshal:reader ];
			}


            [ _service Push: arg0 ];
            
        }
    
        case 1:{
			UInt32 arg0 = (UInt32)0;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				arg0 = [reader ReadUInt32];
			}


            [ _service Notify: arg0 ];
            
        }
    
        case 2:{
			GSDevice* arg0 = [[GSDevice alloc] init];

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

				[arg0 unmarshal:reader ];
			}

			BOOL arg1 = FALSE;

			{

				GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

				arg1 = [reader ReadBool];
			}


            [ _service DeviceStateChanged: arg0  withArg1:arg1 ];
            
        }
    
    }
    return nil;
}

@end


@implementation GSChatClientRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSChatClientRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (NSError*) Push:(GSChatMail*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg0 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return [_channel Post: call];
    
}

- (NSError*) Notify:(UInt32) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteUInt32 :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return [_channel Post: call];
    
}

- (NSError*) DeviceStateChanged:(GSDevice*) arg0  withArg1:(BOOL) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)2;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg0 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteBool :arg1];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    
    return [_channel Post: call];
    
}

@end



