#import <com/gschat/gschat.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSMailTypeHelper

+ (void) marshal:(GSMailType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSMailType) unmarshal:(id<GSReader>) reader {
    return (GSMailType)[reader ReadByte];
}

+ (NSString*) tostring:(GSMailType)val {
    
    switch(val)
    {
    
    case GSMailTypeSingle:
       return @"GSMailTypeSingle";
    
    case GSMailTypeMulti:
       return @"GSMailTypeMulti";
    
    case GSMailTypeSystem:
       return @"GSMailTypeSystem";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSUserNotFound
+ (instancetype)init {
    return [[GSUserNotFound alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSUserNotFound";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end

@implementation GSUserAuthFailed
+ (instancetype)init {
    return [[GSUserAuthFailed alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSUserAuthFailed";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end

@implementation GSServiceTypeHelper

+ (void) marshal:(GSServiceType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSServiceType) unmarshal:(id<GSReader>) reader {
    return (GSServiceType)[reader ReadByte];
}

+ (NSString*) tostring:(GSServiceType)val {
    
    switch(val)
    {
    
    case GSServiceTypeUnknown:
       return @"GSServiceTypeUnknown";
    
    case GSServiceTypeIM:
       return @"GSServiceTypeIM";
    
    case GSServiceTypeANPS:
       return @"GSServiceTypeANPS";
    
    case GSServiceTypeAuth:
       return @"GSServiceTypeAuth";
    
    case GSServiceTypeClient:
       return @"GSServiceTypeClient";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSProperty
+ (instancetype)init {
    return [[GSProperty alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Value = @"";
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteString :_Key];


	[writer WriteString :_Value];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Value = [reader ReadString];


}

@end



@implementation GSIMAuthService{
    id<GSIMAuth> _service;
}
+ (instancetype) init:(id<GSIMAuth>)service withID:(UInt16) serviceID {
    return [[GSIMAuthService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSIMAuth>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}

		NSMutableArray * arg1 = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSProperty* v3 = [[GSProperty alloc] init];

				[v3 unmarshal:reader ];

				[ arg1 addObject: v3];

			}
		}


        NSMutableArray * ret = [ _service Login: arg0  withArg1:arg1 ];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt16:ret.count];			for(id v3 in ret){
				GSProperty* vv3 = (GSProperty*)v3;
				[vv3 marshal: writer];
			}
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    case 1:
    {
		NSMutableArray * arg0 = [NSMutableArray arrayWithCapacity: 0];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			UInt16 imax3 = [reader ReadUInt16];

			for(UInt16 i3 = 0; i3 < imax3; i3 ++ ){

				GSProperty* v3 = [[GSProperty alloc] init];

				[v3 unmarshal:reader ];

				[ arg0 addObject: v3];

			}
		}


        [ _service Logoff: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSIMAuthRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSIMAuthRPC alloc] initRPC: channel withID: serviceID];
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

		[writer WriteUInt16:arg1.count];		for(id v2 in arg1){
			GSProperty* vv2 = (GSProperty*)v2;
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

				GSProperty* v3 = [[GSProperty alloc] init];

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

		[writer WriteUInt16:arg0.count];		for(id v2 in arg0){
			GSProperty* vv2 = (GSProperty*)v2;
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




@implementation GSMail
+ (instancetype)init {
    return [[GSMail alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _SQID = (UInt32)0;
        
        _TS = (UInt64)0;
        
        _Sender = @"";
        
        _Receiver = @"";
        
        _Type = GSMailTypeSingle;
        
        _Content = @"";
        
        _Attachments = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt32 :_SQID];


	[writer WriteUInt64 :_TS];


	[writer WriteString :_Sender];


	[writer WriteString :_Receiver];


	[GSMailTypeHelper marshal: _Type withWriter: writer];


	[writer WriteString :_Content];


	[writer WriteUInt16:_Attachments.count];	for(id v1 in _Attachments){
		GSAttachment* vv1 = (GSAttachment*)v1;
		[vv1 marshal: writer];
	}


}
- (void) unmarshal:(id<GSReader>) reader {

	_SQID = [reader ReadUInt32];


	_TS = [reader ReadUInt64];


	_Sender = [reader ReadString];


	_Receiver = [reader ReadString];


	_Type = [GSMailTypeHelper unmarshal: reader];


	_Content = [reader ReadString];


	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSAttachment* v1 = [[GSAttachment alloc] init];

		[v1 unmarshal:reader ];

		[ _Attachments addObject: v1];

	}


}

@end

@implementation GSAttachment
+ (instancetype)init {
    return [[GSAttachment alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Type = GSAttachmentTypeText;
        
        _Content = [[NSMutableData alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[GSAttachmentTypeHelper marshal: _Type withWriter: writer];


	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Type = [GSAttachmentTypeHelper unmarshal: reader];


	_Content = [reader ReadBytes];


}

@end



@implementation GSIMClientService{
    id<GSIMClient> _service;
}
+ (instancetype) init:(id<GSIMClient>)service withID:(UInt16) serviceID {
    return [[GSIMClientService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSIMClient>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		GSMail* arg0 = [[GSMail alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			[arg0 unmarshal:reader ];
		}


        [ _service Push: arg0 ];
        
        break;
    }
    
    case 1:
    {
		UInt32 arg0 = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadUInt32];
		}


        [ _service Notify: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSIMClientRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSIMClientRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Push:(GSMail*) arg0 {
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
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

- (id<GSPromise>) Notify:(UInt32) arg0 {
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
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end




@implementation GSAttachmentTypeHelper

+ (void) marshal:(GSAttachmentType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSAttachmentType) unmarshal:(id<GSReader>) reader {
    return (GSAttachmentType)[reader ReadByte];
}

+ (NSString*) tostring:(GSAttachmentType)val {
    
    switch(val)
    {
    
    case GSAttachmentTypeText:
       return @"GSAttachmentTypeText";
    
    case GSAttachmentTypeImage:
       return @"GSAttachmentTypeImage";
    
    case GSAttachmentTypeVideo:
       return @"GSAttachmentTypeVideo";
    
    case GSAttachmentTypeAudio:
       return @"GSAttachmentTypeAudio";
    
    case GSAttachmentTypeGPS:
       return @"GSAttachmentTypeGPS";
    
    case GSAttachmentTypeCustomer:
       return @"GSAttachmentTypeCustomer";
    
    default:
       return @"Unknown val";
   }
}

@end




@implementation GSIMServerService{
    id<GSIMServer> _service;
}
+ (instancetype) init:(id<GSIMServer>)service withID:(UInt16) serviceID {
    return [[GSIMServerService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSIMServer>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		GSMail* arg0 = [[GSMail alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			[arg0 unmarshal:reader ];
		}


        UInt64 ret = [ _service Put: arg0 ];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteUInt64 :ret];
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    case 1:
    {
		UInt32 arg0 = (UInt32)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadUInt32];
		}


        [ _service Pull: arg0 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSIMServerRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSIMServerRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Put:(GSMail*) arg0 {
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
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		UInt64 callreturn = (UInt64)0;

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadUInt64];
		}


        return ((id<GSPromise>(^)(UInt64))block)(callreturn);;
    });
}

- (id<GSPromise>) Pull:(UInt32) arg0 {
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
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end



