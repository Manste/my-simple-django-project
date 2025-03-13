from rest_framework import serializers
from bson import ObjectId  # Import ObjectId for handling MongoDB IDs
from .models import Item  # Import your model

class ItemSerializer(serializers.ModelSerializer):
    id = serializers.SerializerMethodField()  # Custom handling for id

    class Meta:
        model = Item
        fields = '__all__'  # Include all fields

    def get_id(self, obj):
        """Convert ObjectId to string"""
        return str(obj.id) if isinstance(obj.id, ObjectId) else obj.id
