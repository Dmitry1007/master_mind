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
