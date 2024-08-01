# Developing Applications with the Intel Context Sensing Technology Service Client

## Overview

You will need the class library `Intel.Cst.Ipc.dll` for communicating with the service.

The entry point to the API is the `ClientBackendLink` class which gives access to Walk Away Lock (WAL), Wake on Approach (WOA),
No Lock on Presence (NLOP) and Adaptive Dimming features. As feature enable/disable calls are asynchronous
the callback object given to the class constructor is used to indicate status.

## Including the `Intel.Cst.Ipc` DLL in a Visual Studio project

While you can directly link your application to the `Intel.Cst.Ipc` DLL, this will not resolve its .NET dependencies automatically.
We provide a `.nupkg` file with the DLL that allows for installation and version management with NuGet.
If you wish to use it, here is how you can set up your environment.

1. Create a local folder to store the folder contained within the `Intel.Cst.Ipc` folder. It will be named with the version number.
2. Add this folder to the Visual Studio Nuget Package Manager (Tools->NuGet Package Manager->Package Manager Settings->Package Sources).
3. Right-click on the project or solution in the Solution Explorer and click on "Manage NuGet Packages...".
4. Click on "Browse", and select the local folder package source added in step 2.
5. Select and install the `Intel.Cst.Ipc` package. Visual Studio will automatically download and install the dependent NuGet packages.
6. Updates can be performed from the same place. Put the new folder with the new version number in the local folder created in step 1. Then, the NuGet Package Manager will give you the option to update the package.

If you do not wish to use the NuGet Package Manager, the depedencies are listed in the included `Intel.Cst.Ipc.deps.json` file.

## API Reference

First we define the supported features

```csharp
namespace Intel.Cst.Client
{
    public enum FeatureType
    {
        LOCK = 1,
        WAKE,
        APPLICATION,
        NOLOCKONPRESENCE,
        ADAPTIVEDIMMING,
        ONLOOKERDETECTION
    }
}
```

and support enums for command responses and errors

```csharp
    public enum ResponseType
    {
        ENABLE_SUCCESS = 0,
        DISABLE_SUCCESS,
        NO_CHANGE,
        UNKNOWN
    }

    public enum EventType
    {
        UNKNOWN = 0,
        EVENT_EXTERNAL_MONITOR = 1,
        EVENT_WAL,
        EVENT_WOA,
        PROXIMITY,
        EVENT_SERVICE_RECOVERED,
        EVENT_DTT_STARTED, // deprecated
        EVENT_ONLOOKER_DETECTED,
        EVENT_SNOOZE_COMPLETE,
        EVENT_ADAPTIVE_DIMMING,
        EVENT_CST_CAPABILITY_CHANGED,
        EVENT_CST_EXTENDED_CAPABILITY_CHANGED,
        EVENT_IPF_STARTED,
        EVENT_BIOMETRIC_SENSOR_STATUS_CHANGED
    }

    public enum ErrorType
    {
        Success = 0,
        ServiceStopped,
        ServiceUnavailable,
        ServiceRecoveryInProgress,
        EnableError,
        DisableError,
        GetOptionsError,
        SetOptionError,
        DttUnavailable,
        ServiceVersionIncompatible,
        BadRequest,
        Unimplemented,
        GetHumanPresenceError,
        FileIOError,
        HelperServiceCommandError,
        GetFeatureCapabilityError,
        ExecuteCommandError,
        CommandNotFoundError,
        IpfUnavailable
    }

    public class Error
    {
        public ErrorType ErrorType { get; set; }
        public string Description { get; set; }
    }

    public enum SettingsAccessType
    {
        LOCAL = 0,
        GLOBAL = 1,
        RESERVED = 2
    }

    public enum HumanPresenceStatus
    {
        NOT_PRESENT = 0,
        DISENGAGED = 1,
        ENGAGED = 2,
        FACE_ENGAGED = 3,
        INVALID = 99
    }

    public enum HumanPresenceStatusType
    {
        POLICY, // Combined user presence value based on all inputs and user preferences
        SENSOR, // User presence as determined by the main active sensor
        PLATFORM // Fused user presence from the sensor and HID values
    }

    public enum FeatureProperty
    {
        AppName,
        DetectionDelayInterval,
        DimmingInterval,
        DimScreen,
        DimTarget,
        DimWhenOnlookerDetected,
        DisengagedDimWaitTime,
        DisplayOffAfterLock,
        EnableAudioMode,
        EnabledEvents,
        EnableOnBattery,
        EnableOnLowBattery,
        EnableWithExtMonitor,
        ExternalMonitor, // Deprecated, do not use for any new development.
        FailSafeTimeout,
        FeatureEnabled,
        LaunchOnUserLogIn, // Deprecated, do not use for any new development.
        LockAfterDimInterval,
        LowBatteryRemainingPercentageLimit,
        Misprediction1DimWaitTime,
        Misprediction2DimWaitTime,
        Misprediction3DimWaitTime,
        Misprediction4DimWaitTime,
        MispredictionFaceDetection,
        MispredictionTimeWindow,
        MonitorApp,
        NotPresentDimTarget,
        NotPresentDimWaitTime,
        OnlookerAbsenceWaitInterval,
        PowerRequest,
        PreDimInterval,
        Protocol, // Deprecated, do not use for any new development.
        PrivacyEnabled,
        WaitInterval,
        WakeOnLowBattery,
    }

    public class FeatureSetting { }

    public class LockFeatures : FeatureSetting
    {
        public bool WALEnabled;
        public int PreDimInterval;
        public int DimmingInterval;
        public int NotPresentDimTarget;
        public int LockAfterDimInterval;
        public int WaitInterval;
        public bool DimScreen;
        public bool ExternalMonitor; // Deprecated, do not use for new development.
        public bool EnableLockWithExternalMonitor;
        public bool PowerRequest;
        public bool DisplayOffAfterLock;
        public bool EnableAudioMode;
    }

    public class WakeFeatures : FeatureSetting
    {
        public bool WOAEnabled;
        public bool WakeOnLowBattery;
        public bool ExternalMonitor; // Deprecated, do not use for new development.
        public bool EnableWakeWithExternalMonitor;
        public int LowBatteryRemainingPercentageLimit;
    }

    public class NoLockOnPresenceFeatures : FeatureSetting
    {
        public bool NLoPEnabled;
        public int WaitInterval;
        public bool ExternalMonitor; // Deprecated, do not use for new development.
        public bool EnableNLoPWithExternalMonitor;
        public bool EnableOnBattery;
        public int LowBatteryRemainingPercentageLimit;
        public int FailSafeTimeout;
    }

    public class AppFeatures : FeatureSetting
    {
        public bool MonitorApp;
        public bool LaunchOnUserLogIn; // Deprecated, do not use for new development.
        public string AppName;
        public string Protocol; // Deprecated, do not use for new development.
        public List<string> EnabledEvents;
        public bool PrivacyEnabled;
    }

    public class AdaptiveDimmingFeatures : FeatureSetting
    {
        public bool ADEnabled;
        public bool ExternalMonitor; // Deprecated, do not use for new development.
        public bool PowerRequest;
        public bool EnableAudioMode;
        public bool EnableAdaptiveDimmingWithExternalMonitor;
        public int DisengagedDimWaitTime;
        public int NotPresentDimWaitTime;
        public bool MispredictionFaceDetection;
        public int MispredictionTimeWindow;
        public int Misprediction1DimWaitTime;
        public int Misprediction2DimWaitTime;
        public int Misprediction3DimWaitTime;
        public int Misprediction4DimWaitTime;
        public int DimmingInterval;
        public int DimTarget;
    }

    public class OnlookerDetectionFeatures : FeatureSetting
    {
        public bool OnlookerDetectionEnabled;
        public bool EnableOnlookerDetectionWithExternalMonitor;
        public int DetectionDelayInterval;
        public bool DimWhenOnlookerDetected;
        public int DimmingInterval;
        public int DimTarget;
        public bool EnableOnLowBattery;
        public int LowBatteryRemainingPercentageLimit;
        public int OnlookerAbsenceWaitInterval;
    }
```

Now we define callback required for enabling/disabling features

```csharp
namespace Intel.Cst.Client
{
    public interface IFeatureCallback
    {
        // Called when feature has been successfully enabled or disabled
        void OnSuccess(FeatureType featureType, ResponseType responseType);
        // Called on an event (e.g. on a WAL proximity distance change)
        void OnEvent(FeatureType featureType, EventType eventType, object eventPayload);
        // Called on error
        void OnError(FeatureType featureType, Error state);
    }
}
```

Now the `ClientBackendLink` class definition

```csharp
namespace Intel.Cst.Client
{
    class ClientBackendLink : IDisposable
    {
        ClientBackendLink(IFeatureCallback callback, ClientBackendLinkOptions options = null);     // Constructor takes callback object (and optionally a configuration object)
        void Enable(FeatureType featureType); // Enables specified feature. Result is handled by callback
        void Disable(FeatureType featureType); // Disables specified feature. Result is handled by callback
        Task SetOption(FeatureType featureType, // Returns a task that that sets a feature property using specified key and value
                        FeatureProperty property,
                        object propertyValue,
                        SettingsAccessType settingsMode = SettingsAccessType.LOCAL);
        Task<FeatureSetting> GetOptions( // Returns a task that is used to make GetOptions call for specified feature.
                        FeatureType featureType,
                        SettingsAccessType settingsMode = SettingsAccessType.LOCAL);
        Task<HumanPresenceStatus> GetHumanPresenceStatus(HumanPresenceStatusType presenceType); // Gets current presence status for specified type
        Task<FeatureCapability> GetFeatureCapability(FeatureType featureType); // Gets the FeatureCapability for the specified feature
        Task<IDictionary<FeatureType, FeatureCapability>> GetAllFeatureCapabilities(); // Gets all FeatureCapabilities exposed by ICST
        Task<string> ExecuteCommand(string commandString, Object inputData); // Executes a generic command (see below)
        Task SnoozeOnlookerDetection(int snoozeTime); // Snooze Onlooker Detection for the specified time. If 0 or a negative integer is provided, disable snooze.
    }
}
```

Note that `ClientBackendLink` implements the C# dispose pattern. If you wish to disconnect from ICST, you must call `ClientBackendLink.Dispose`
to do so. If you do not, the disconnection will not happen until the garbage collector runs, which can be long after the object has stopped
being used. Applications that disconnect and then reconnect at some later time for whatever reason must call `Dispose` to avoid cases where
the application holds onto multiple connections to the service at once, potentially exhausting the system limit of 16 connections at once.
Applications like the SampleApp which only create one `ClientBackendLink` object don't need to worry about this. The `ClientBackendLink` class
can handle service reconnections on its own.
For more information about working with disposables, see the [.NET documentation](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/implementing-dispose).

For example:

```csharp
ClientBackendLink client = new ClientBackendLink(new Callback());
// make calls to ICST here
client.Dispose();
// other things happen
client = new ClientBackendLink(new Callback()); // OK because Dispose was called before losing the reference to the previous object
```

The `ClientBackendLink` class also has a retry mechanism. If ICST cannot be reached (service starting up, named pipe glitch, etc.), the
DLL will automatically retry. The maximum number of retries can be set in the constructor by providing an instance of `ClientBackendLinkOptions`
with the `MaxRetries` parameter set to the desired number. If you are OK with the default, it is not necessary to pass in an instance of
`ClientBackendLinkOptions`. It is an optional parameter for the constructor.

```csharp
ClientBackendLinkOptions clientOptions = new ClientBackendLinkOptions(10); // Default is 5
ClientBackendLink client = new ClientBackendLink(new Callback(), clientOptions);
```

## Working with FeatureCapabilities

The FeatureCapability class describes the structure of the data given by ICST.

```csharp
public class FeatureCapability
    {
        bool Capable; // True if the feature can function normally on this system, False otherwise.
        IDictionary<string, string> ExtendedStatus; // Dictionary of additional information that some features provide.
    }
```

Clients may subscribe to the `EVENT_CST_CAPABILITY_CHANGED` and `EVENT_CST_EXTENDED_CAPABILITY_CHANGED` to be notified of changes to these capabilities, if desired.

The extended status information available depends on the feature. Not all features have anything reported in their extended status field.

- `FeatureType.APPLICATION`
  - `ActiveBiometricPresenceSensor` - The current, active sensor being used for context sensing.
    - The possible values are: "Invalid", "NonVision", "Vision", "ExternalNonVision", and "ExternalVision".
  - `ActiveBiometricPresenceSensorStatus` - The status of the active biometric presence sensor.
    - The possible values are listed in the Windows Sensor API documentation: <https://docs.microsoft.com/en-us/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate>
    - The `BiometricSensorStatusChanged` CST event will send `True` if the sensor status changes to SENSOR_STATE_READY, and `False` if it changes from ready to anything else. `ActiveBiometricPresenceSensorStatus` can be used to get the initial state of this event if desired.
    - `CorrelationStatus` - `"True"` if Sensor-HID correlation is positive, `"False"` if negative.
- `FeatureType.ONLOOKERDETECTION`
  - `OnlookerDetected` - `"True"` if an onlooker is detected, `"False"` otherwise.
  - `SensorStatus` - Status of the onlooker virtual sensor
  - `SnoozeActive` - `"True"` if Onlooker Detection has been snoozed, `"False"` otherwise.
- `FeatureType.ADAPTIVEDIMMING`
  - `MispredictionCount` - The current Adaptive Dimming misprediction count (the number of HID-Sensor miscorrelations happening right after AD becomes active)

## Generic command execution (advanced users)

To reduce the number of recompiliations required on the client side, a new API call has been added, `ExecuteCommand`. This API allows for execution of commands dynamically. For most use cases, it is simpler (and recommended) to use the defined API calls so that the output type conversion will be handled by the SDK.

`ExecuteCommand` always returns a JSON-formatted string with the results. You can use your favorite JSON library to deserialize the results. The ICST client SDK uses
the widely-used `Newtonsoft.Json` library for the API calls that return specific objects.

To use the `ExecuteCommand` API, simply pass in the command and the expected data type as listed in this document. For example:

```csharp
// API call
clientBackendLink.SnoozeOnlookerDetection(1000); // snooze OD for 1 second

// Equivalent generic call
clientBackendLink.ExecuteCommand("set_value ONLOOKER_SNOOZE", 1000);
```

Note that if the argument type is wrong, the command will fail and signal as such by throwing an exception.

You can cast the below enum values to their string representations when building commands, if desired.

```csharp
    public enum RequestType
    {
        //Request type to snooze onlooker detection
        ONLOOKER_SNOOZE = 0,
        //Request type to get feature capability
        FEATURE_CAPABILITY,
        //Request type to get all feature capabilities
        ALL_FEATURE_CAPABILITIES,
        //Request type to get human presence status
        HUMAN_PRESENCE_STATUS
    }

    public enum CommandType
    {
        set_value = 0,
        get_value,
        set_option,
        get_options
    }
```

`set_option` and `get_option` use a dictionary as the payload to communicate the details of the request to ICST.

```csharp
    // PayloadType defines the entries of the dictionary used for the options APIs
    public enum PayloadType
    {
        FeatureType = 0,
        FeatureProperty,
        PropertyValue,
        SettingsAccessType
    }

{
    // Given ClientBackendLink link, FeatureType featureType, FeatureProperty property, object propertyValue, and SettingsAccessType settingsMode
    IDictionary<string, object> optionsData = new Dictionary<string, object>
    {
        {PayloadType.FeatureType.ToString(), featureType},
        {PayloadType.FeatureProperty.ToString(), property},
        {PayloadType.PropertyValue.ToString(), propertyValue},
        {PayloadType.SettingsAccessType.ToString(), settingsMode}
    };
    await link.ExecuteCommand(CommandType.set_option.ToString(), optionsData);
}

{
    // Given ClientBackendLink link, FeatureType featureType, and SettingsAccessType settingsMode
    IDictionary<string, object> optionsData = new Dictionary<string, object>
    {
        {PayloadType.FeatureType.ToString(), featureType},
        {PayloadType.SettingsAccessType.ToString(), settingsMode}
    };
    string featureSettingStatus = await link.ExecuteCommand(CommandType.get_options.ToString(), optionsData);
    FeatureSetting settings = Newtonsoft.Json.JsonConvert.DeserializeObject<FeatureSetting>(featureSettingStatus); // Replace FeatureSetting with the subclass you are expecting based on featureType
}
```

## Sample console application

This sample shows how to enable/disable some of the features and get options

```csharp
using System;
using System.Threading;
using System.Diagnostics;
using Intel.Cst.Client;
using System.Threading.Tasks;

namespace HupConsoleApp
{
    class HupListener : IFeatureCallback
    {
        private bool error;
        private ManualResetEvent responseEvent;
        private Stopwatch stopWatch;

        public HupListener()
        {
            responseEvent = new ManualResetEvent(false);
            Reset();
            stopWatch = new Stopwatch();
            stopWatch.Start();
        }

        public void Reset()
        {
            error = false;
            responseEvent.Reset();
        }

        public void OnSuccess(FeatureType featureType, ResponseType responseType)
        {
            Console.WriteLine("{0} {1}", featureType, responseType);
            responseEvent.Set();
        }

        public void OnEvent(FeatureType featureType, EventType eventType, object eventPayload)
        {
            Console.Write("{0}: {1} OnEvent: {2}", stopWatch.ElapsedMilliseconds, featureType, eventType.ToString());
            if (eventType == EventType.EVENT_WAL)
            {
                Console.Write("Received walk away lock event!");
            }
            Console.WriteLine();
        }

        public void OnError(FeatureType featureType, Error state)
        {
            error = true;
            Console.WriteLine("{0} OnError: {1}", featureType, state.Description);
            responseEvent.Set();
        }

        public int Wait(int timeoutMs)
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();
            if (responseEvent.WaitOne(timeoutMs))
                return (int)stopwatch.ElapsedMilliseconds;
            else
                return -1;
        }

        public void WaitLog(int timeoutMs)
        {
            int responseTime = Wait(timeoutMs);
            if (responseTime < 0)
            {
                Console.WriteLine("Error - no response");
                return;
            }
            if (!error)
            {
                Console.WriteLine("Succeeded in {0}ms", responseTime);
            }
            else
            {
                Console.WriteLine("Failed");
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            bool finished = false;
            HupListener hupListener = new HupListener();
            ClientBackendLink client = new ClientBackendLink(hupListener);

            Console.WriteLine("Select command");
            Console.WriteLine(" 1 - GetOptions(WAL)");
            Console.WriteLine(" 2 - GetOptions(WOA)");
            Console.WriteLine(" 0 - Exit");

            do
            {
                ConsoleKeyInfo option = Console.ReadKey(true);
                switch (option.KeyChar)
                {
                    case '0':
                        finished = true;
                        break;
                    case '1':
                        Console.WriteLine("Calling GetOptions for WAL");
                        hupListener.Reset();
                        Task<FeatureSetting> lockTask = client.GetOptions(FeatureType.LOCK);
                        lockTask.Wait();
                        Console.WriteLine(lockTask.Result);
                        break;
                    case '2':
                        Console.WriteLine("Calling GetOptions for WOA");
                        hupListener.Reset();
                        Task<FeatureSetting> wakeTask = client.GetOptions(FeatureType.WAKE);
                        wakeTask.Wait();
                        Console.WriteLine(wakeTask.Result);
                        break;
                }
            } while (!finished);
        }
    }
}
```

## Handling Errors

In general, ICST SDK API calls will throw an `ErrorException` with the description and an `ErrorType`. when they fail. For backwards compatibility with the IUAS/ICSS interface, `Enable` and `Disable` call the error callback with the error instead.

Additionally, to support backwards compatibility, the `ErrorType` of the `ErrorException`'s `Error` object will be either:

1. `ExecuteCommandError` if the API was invoked with `ExecuteCommand` or is an API call introduced after the IUAS/ICSS to ICST transition (for example, `SnoozeOnlookerDetection`). This will reduce the amount of handling needed for `ErrorException`s as new commands will not yield a different error type.
2. The `ErrorType` corresponding to the API call for methods implemented before `ExecuteCommand`. These errors are: `GetOptionsError`, `SetOptionError`, `GetHumanPresenceError`, and `GetFeatureCapabilityError`.
Because these are raised in response to a failure on an API call, the `ErrorType` is redundant to the context; the description will have the important information. Errors sent to the error callback have the code to provide extra information for easier error dispatching.

If ICST loses its connection to IPF, it will invoke the error callback with the `IpfUnavailable` error. When the connection to IPF is restored, it will send an `EVENT_IPF_STARTED` event.

## Notes on Using GetOptions()

The `GetOptions` method ensures that the client is aware of service settings, so should be called in the following situations:

- When starting application
- When recovering from service errors
- When starting the service with a trigger start
- On a user session switch

If a `SetOption()` call fails, the U/I must be aware that the new value has not taken. A brute force solution is to make a GetOptions call and update U/I with result.

## Subscribing to events with SetOptions()

Many CST events can be subscribed/unsubscribed to by altering the value of the `EnabledEvents` option. The map of event type to option string is avaliable in the `EventTypeMap.EventSubscriptionNames` class.

```csharp
    public static class EventTypeMap
    {
        /// <summary>
        /// Dictionary mapping EventTypes to options strings. Use these when making get/set option calls for enabled events.
        /// </summary>
        public static readonly Dictionary<EventType, string> EventSubscriptionNames = new Dictionary<EventType, string>()
        {
            {EventType.EVENT_EXTERNAL_MONITOR, "ExternalMonitor"},
            {EventType.EVENT_WAL, "WalkAwayLock"},
            {EventType.EVENT_WOA, "WakeOnApproach"},
            {EventType.PROXIMITY, "ProximityDistance"},
            {EventType.EVENT_ONLOOKER_DETECTED, "OnlookerDetected"},
            {EventType.EVENT_ADAPTIVE_DIMMING, "AdaptiveDimming"},
            {EventType.EVENT_CST_CAPABILITY_CHANGED, "FeatureCapability"},
            {EventType.EVENT_CST_EXTENDED_CAPABILITY_CHANGED, "FeatureExtendedCapability"},
            {EventType.EVENT_BIOMETRIC_SENSOR_STATUS_CHANGED, "BiometricSensorStatusChanged"}
        };
    }
```

Event types not in this map will always be sent, as they are related to infrastructure (EVENT_IPF_STARTED, for example) or respond to events only triggered by clients (EVENT_SNOOZE_COMPLETE, for example). Client apps do not necessarily need to take action when these events occur, however.

## Using Service Triggers

If the service is configured to use [trigger start with custom events](https://docs.microsoft.com/en-us/windows/win32/services/service-trigger-events).
The advantage of service triggers is that you do not need admin privildges to issue a start requests. Event details are as follows:

- Event UUID is F8445F8F-18D5-4076-A2C0-9D1669782993
- To start service send event with string 'Start'

The sample application includes a class `ServiceTrigger` that can detect if triggering is enabled, start and stop the service.
The start and stop methods both return 0 if event was successfully sent, otherwise a Windows error code. Checking that service is running is the responsibility of the caller.
The is no .NET support for trigger events, so P/Invoke and unmanaged data marshalling must be used.

```csharp
class ServiceTrigger
{
    bool IsEnabled();
    uint Start();
}
```

## Notes on Using GetHumanPresenceStatus()

GetHumanPresenceStatus is used to query the current presence value that IPF has evaluated.

- SENSOR - Raw sensor data
- PLATFORM - SENSOR + HID activity
- POLICY - Combined final presence value that includes PLATFORM and user preferences (e.g user doesn't care about external monitor, so it won't be factored in)
SENSOR and PLATFORM are under evaluation and are not recommended for production use at this time.

## Notes on Opting In/Out of Vision Sensor usage

User selection on using the vision sensor (if available on the system) is presented as the 'PrivacyEnabled' application choice.
When privacy is enabled, registration to the vision sensor will be canceled, and if available the non-vision presence sensor will be used instead.
When a sensor change is successful, an OnSuccess() event will be received with the contextual result of the action; otherwise an error will be surfaced instead.

## Global mode vs local mode access

The ICST SDK API has two levels of access that are assigned by username.

1. Local: current foreground user
2. Global: `NT AUTHORITY\SYSTEM`

Most API calls will work if you are running as a local or global user. Certain commands (right now, only Get/SetOption) will apply an extra level of checking
if they provide local vs global mode functionality, where local mode users will not be able to make a global mode call, but a global mode user may make local
mode calls as well.

Due to a WMI limitation, some types of remote desktop connections (like Microsoft's RDC) prevent CST from detecting the current user. In those situations,
on top of temporarily stopping context sensing actions, local mode access is forbidden because the request cannot be validated as coming from the foreground
user. In those cases, only requests made by `NT AUTHORITY\SYSTEM` will go through. However, even `NT AUTHORITY\SYSTEM` will be unable to make local options
calls, because CST will not be able to determine the username. Global options calls and other APIs should still function for `SYSTEM`.

## Copyright notice

This document and all accompanying binary and source code is copyright (c) 2021 Intel Corporation.
