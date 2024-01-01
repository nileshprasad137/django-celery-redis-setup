import time
from django_celery_redis.mq import app


@app.task
def send_email_simulation(email_address, subject, message):
    print(f"Sending email to {email_address} | Subject: {subject}")
    # Here, you would implement your email sending logic.
    time.sleep(2)
    return f"Email sent to {email_address} with subject {subject}"
