# 000_Webhook notifications.pdf

## Page 1

Webhooks enable a system to send real-time data to another system over the web. Unlike
traditional APIs, where one system must make a request when receiving data, a webhook enables
you to push data to the receiving system as soon as an event occurs. Webhooks are event-driven
meaning they are triggered by a specific action or event and immediately send the relevant data t
a predefined URL, also called the “webhook URL” or “callback URL”.
A notification webhook is an endpoint you create on your server. This webhook endpoint receives
HTTP POST requests from App Store Connect. The POST requests describe important events
about your app. Use the webhooks notifications endpoint to configure the notifications for events
happening to your apps.
To invoke your webhook, App Store Connect needs to know your server’s webhook endpoint URL
To set up your webhook endpoint the first time, provide the URL to the Create a webhook
configuration endpoint.
To learn more about:
Configuring a webhook URL using the API, see Configuring and parsing App Store Connect AP
webhook notifications.
Events that can trigger a webhook notification, see Understanding webhook events and
WebhookEventType.
Overview
Topics
Essentials
App Store Connect API / Webhook notifications
API Collection
Webhook notifications
Manage notifications from App Store about your apps and their statuses.


## Page 2

Configuring and parsing App Store Connect API webhook notifications
Manage the configuration, testing, and processing of App Store Connect API notifications fo
your app.
Understanding webhook events
Learn the events that describe payloads and the notifications the system sends.
Read webhook information for an app
Read webhook configuration details for a specific app.
Read webhook information
Read configuration details for a specific webhook.
Create a webhook configuration
Add a new webhook configuration.
Modify a webhook configuration
Update details for a specific webhook.
Delete a webhook
Remove a specific webhook configuration.
Read the deliveries for a webhook
Get a list of deliveries for a specific webhook configuration.
GET /v1/webhooks/{id}/relationships/deliveries
Redeliver a previous notification
Resend a webhook notification from a specified template.
Test your webhook
Send an event to your server to verify your server-side webhook configuration.
Managing webhook notifications
Managing webhook deliveries
Testing webhook configuration
Objects and types


## Page 3

object Webhook
The data structure that represents a webhook resource.
object WebhookCreateRequest
The request body you use to create a webhook create request resource.
object WebhookDeliveriesResponse
A response that contains a list of response resources for webhook deliveries.
object WebhookDelivery
The data structure that represents a webhook delivery resource.
object WebhookDeliveryCreateRequest
The request body you use to create a webhook delivery create request resource.
object WebhookDeliveryResponse
A response that contains a single webhook delivery response resource.
object WebhookEvent
The data structure that represents a webhook event resource.
object WebhookPing
The data structure that represents a webhook ping resource.
object WebhookPingCreateRequest
The request body you use to create a webhook ping create request resource.
object WebhookPingResponse
A response that contains a single webhook ping response resource.
object WebhookResponse
A response that contains a single webhook response resource.
object WebhookUpdateRequest
The request body you use to update a webhook update request.
object WebhooksResponse
A response that contains a list of webhooks response resources.
type WebhookEventType
A string that represents the the event types for a webhook notification.
object WebhookDeliveriesLinkagesResponse


## Page 4

object AppWebhooksLinkagesResponse


