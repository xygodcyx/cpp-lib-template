#pragma once

#include <ostream>

struct Vector3 {
    float x, y, z;
    Vector3() = default;
    Vector3(float x, float y, float z) : x(x), y(y), z(z) {
    }
    Vector3 operator+(const Vector3& other) const;
};

std::ostream& operator<<(std::ostream& stream, const Vector3& other);
