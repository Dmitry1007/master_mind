### [Project Title]

housesreallyarentallthathard.com (I'm not good at titles)

#### Pitch

A reminder system aimed at new homeowners.

#### Description

Users can provide data about location, and can then customize a list of reminders
(there will be a notification system built into the site, but users can also
opt-in to email and text reminders).  The idea is to keep everything relevant
to home maintenance in a single location.  A few examples: changing air filters,
cleaning gutters, furnace maintenance, and suggestions for watering plants based
on average rainfall for a particular location.  Users can select from a predefined
list of common household chores or create custom notifications.

#### Target Audience

One of the main targets is new homeowners, but really it would be useful for
anyone who wants to organize the process of maintaining a home and have relevant
information in one central location.

#### Integrations

* [What OAuth provider makes sense for this audience?]
OAuth with google makes the most sense to me, but ideally I would include the option
of Google/Facebook/Twitter

* [What Data.gov data or API will you use?]
The NOAA API for climate data could be useful for calculating something like average
rainfall to give notifications for watering plants/checking gutters.  Another
example might be finding average temperature for a specific location and providing
reasonable dates for bringing your plants inside/outside.

* [Any other integrations?]
Integrating with several notification systems is planned, the two obvious ones
being email and text (sendgrid/twilio).


### [Project Title]

(Stealing Jorge's Idea)
Peronsalized info about relevant government issues

#### Pitch

Based on location data and issues, present meaningful data retrieved from the
open-states API.

#### Description

A user will be able to input some location information, specify issues that they
are interested in, and recieve information about state-level government issues.
The two major features as I see them: users can be notified about bills in
progress that deal with issues they have selected, giving them very clear
options for who to contact should they want to get involved (sponsor_id as part
of a reqeust for a bill is an option here).  Users could also see voting
records from local representatives based on specified issues.

#### Target Audience

People interested in government issues who don't want to have to dig to find
bills/representatives relevant to their interests.

#### Integrations

* [What OAuth provider makes sense for this audience?]
Trying to cast the widest net might be my best option, so google/fb/twitter

* [What Data.gov data or API will you use?]
This is where this idea shines I think, the Open States API from sunlight labs
(thanks jeff) is robust and has good documentation

* [Any other integrations?]
Possibly some integration that makes it stupidly easy to contact a representative,
such as being sms'd a phone number.
