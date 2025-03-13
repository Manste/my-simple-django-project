from django.urls import path
from .views import item_list_create

urlpatterns = [
    path('items', item_list_create, name='item-list-create'),
]
