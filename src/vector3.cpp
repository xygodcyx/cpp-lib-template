#include "engine/vector3.h"

Vector3 Vector3::operator+(const Vector3& other) const {
    return {x + other.x, y + other.y, z + other.z};
};

std::ostream& operator<<(std::ostream& stream, const Vector3& other) {
    stream << other.x << ", " << other.y << ", " << other.z;
    return stream;
};
