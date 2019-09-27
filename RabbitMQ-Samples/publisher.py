#!/usr/bin/env python
import pika
import sys
import random



credentials = pika.PlainCredentials('admin-demo', 'dynamicscale123!')
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost',credentials=credentials))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)

for x in range(10000):
    message="Message #" + str(x)
    for y in range(1,random.randint(2,10)):
        message=message + "."

    channel.basic_publish(exchange='',
                          routing_key='task_queue',
                          body=message,
                          properties=pika.BasicProperties(
                             delivery_mode = 2, # make message persistent
                          ))
    print(" [x] Sent %r" % message)
connection.close()
