```python
class Venue(models.Model):
    time_zone = models.CharField(max_length=128, default='UTC')
    ...

class Event(models.Model):
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    venue = models.ForeignKey(Venue, on_delete=models.CASCADE)
    ...
```    