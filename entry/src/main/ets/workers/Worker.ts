import worker, { ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@ohos.worker';

var workerPort : ThreadWorkerGlobalScope = worker.workerPort;

/**
* Defines the event handler to be called when the worker thread receives a message sent by the host thread.
* The event handler is executed in the worker thread.
*
* @param e message data
*/
workerPort.onmessage = function(e : MessageEvents) {
}

/**
* Defines the event handler to be called when the worker receives a message that cannot be deserialized.
* The event handler is executed in the worker thread.
*
* @param e message data
*/
workerPort.onmessageerror = function(e : MessageEvents) {
}

/**
* Defines the event handler to be called when an exception occurs during worker execution.
* The event handler is executed in the worker thread.
*
* @param e error message
*/
workerPort.onerror = function(e : ErrorEvent) {
}