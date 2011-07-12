#
#  JenxNotificationCenter.rb
#  jenx
#
#  Created by Trent Kocurek on 7/11/11.
#  Copyright 2011 Urban Coding. All rights reserved.
#

class JenxNotificationCenter
    def initialize(preferences)
        GrowlApplicationBridge.setGrowlDelegate(self)
        @preferences = preferences
    end

    def applicationNameForGrowl
        "Jenx"
    end

    def growlNotificationWasClicked(clickContext)
    end

    def growlNotificationTimedOut(clickContext)
    end

    def notify(title, message, image, notification_name)
        if @preferences.enable_growl?
            NSLog("Sending growl notification - Title: " + title + ", Message: " + message + ", Notification Name: " + notification_name)
            
            GrowlApplicationBridge
                .notifyWithTitle(
                               title,
                               description: message,
                               notificationName: notification_name,
                               iconData: image,
                               priority: 0,
                               isSticky: false,
                               clickContext: title
                               )
        end
    end
end