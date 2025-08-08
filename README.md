# flutter_form_builder

A new Flutter project.<br>
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.<br>

<img width="299" height="536" alt="image" src="https://github.com/user-attachments/assets/a3688b83-e52e-4a87-97fb-86833938950d" />
<img width="299" height="536" alt="image" src="https://github.com/user-attachments/assets/1755fefd-3a84-4c3b-b29f-bf0405d27dd7" />
<img width="299" height="536" alt="image" src="https://github.com/user-attachments/assets/b09e06a2-82f1-4e4b-ac58-0576a251f7cd" /><br>


# อธิบาย
## 🚀 ฟีเจอร์หลัก

- ✅ **ฟอร์มครบครัน**: ตัวอย่างฟอร์มหลากหลายประเภท
- ✅ **Validation**: ตรวจสอบข้อมูลอัตโนมัติ
- ✅ **UI สวยงาม**: Material Design ที่ใช้งานง่าย
- ✅ **Navigation**: ระบบนำทางระหว่างหน้าจอ
- ✅ **Data Display**: แสดงผลข้อมูลที่กรอก

## 📱 หน้าต่างๆ ในแอป

### 1. 🏠 หน้าหลัก (Main Page)
- รายการตัวอย่างฟอร์มทั้งหมด
- คลิกเพื่อเข้าไปดูแต่ละตัวอย่าง

### 2. 📋 ตัวอย่างฟอร์ม

#### **Complete Form** - ฟอร์มครบครัน
- ข้อมูลส่วนตัว (ชื่อ, อีเมล, เบอร์โทร)
- ที่อยู่ (บ้าน, เมือง, ประเทศ)
- ความชอบ (เพศ, งานอดิเรก, ระดับประสบการณ์)
- ข้อมูลเพิ่มเติม (ไบโอ, การรับข่าวสาร, ช่วงเงินเดือน)

#### **Signup Form** - ฟอร์มสมัครสมาชิก
- ข้อมูลการสมัครพื้นฐาน
- การยืนยันรหัสผ่าน
- เงื่อนไขการใช้งาน

#### **Custom Fields** - ฟิลด์พิเศษ
- **Rating Slider**: ให้คะแนน 1-5 ดาว
- **Color Picker**: เลือกสีที่ชอบ
- **File Upload**: อัปโหลดรูปโปรไฟล์
- **Digital Signature**: ลายเซ็นดิจิทัล (วาดได้จริง!)

#### **Conditional Fields** - ฟิลด์แบบมีเงื่อนไข
- แสดง/ซ่อนฟิลด์ตามการเลือก
- ตัวอย่าง: เลือกอาชีพแล้วแสดงฟิลด์ที่เกี่ยวข้อง

#### **Dynamic Fields** - ฟิลด์แบบเพิ่ม/ลบได้
- เพิ่มฟิลด์ใหม่ได้ไม่จำกัด
- ลบฟิลด์ที่ไม่ต้องการ

#### **Radio & Checkbox Groups** - ตัวเลือกแบบกลุ่ม
- Radio Button: เลือกได้ 1 อัน
- Checkbox: เลือกได้หลายอัน

#### **Related Fields** - ฟิลด์ที่เกี่ยวข้องกัน
- ตัวอย่าง: เลือกจังหวัดแล้วแสดงอำเภอ

## 🛠️ การติดตั้ง

### 1. ตรวจสอบ Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_form_builder: ^10.1.0
  form_builder_validators: ^11.2.0
  intl: ^0.19.0
  flutter_localizations:
    sdk: flutter
```

### 2. รันโปรเจค
```bash
flutter pub get
flutter run
```

## 📖 วิธีใช้งาน

### การกรอกฟอร์ม
1. เปิดแอป
2. เลือกตัวอย่างฟอร์มที่ต้องการ
3. กรอกข้อมูลตามที่ต้องการ
4. กดปุ่ม "Submit" หรือ "ส่งฟอร์ม"

### การดูผลลัพธ์
- หลังจากส่งฟอร์ม จะไปยังหน้าแสดงผล
- แสดงข้อมูลทั้งหมดที่กรอก
- สามารถดูในรูปแบบ JSON ได้

## 🎯 ตัวอย่างการใช้งาน

### ฟอร์มพื้นฐาน
```dart
FormBuilderTextField(
  name: 'email',
  decoration: InputDecoration(labelText: 'อีเมล'),
  validator: FormBuilderValidators.compose([
    FormBuilderValidators.required(),
    FormBuilderValidators.email(),
  ]),
)
```

### ฟอร์มแบบเลือก
```dart
FormBuilderRadioGroup<String>(
  name: 'gender',
  options: [
    FormBuilderFieldOption(value: 'male', child: Text('ชาย')),
    FormBuilderFieldOption(value: 'female', child: Text('หญิง')),
  ],
)
```

### ฟอร์มแบบเลื่อน
```dart
FormBuilderSlider(
  name: 'rating',
  min: 1,
  max: 5,
  divisions: 4,
  initialValue: 3,
)
```

## 🔧 ฟีเจอร์พิเศษ

### Digital Signature
- วาดลายเซ็นด้วยนิ้วหรือ stylus
- ปุ่มล้างลายเซ็น
- เก็บข้อมูลลายเซ็นในฟอร์ม

### File Upload
- จำลองการอัปโหลดไฟล์
- UI ที่สวยงาม
- แสดงสถานะการอัปโหลด

### Conditional Logic
- แสดงฟิลด์ตามเงื่อนไข
- ตัวอย่าง: เลือกอาชีพแล้วแสดงฟิลด์ที่เกี่ยวข้อง

## 📱 การแสดงผล

### หน้าแสดงผลข้อมูล
- แสดงข้อมูลทั้งหมดที่กรอก
- จัดรูปแบบให้อ่านง่าย
- แสดงจำนวนฟิลด์ทั้งหมด
- ปุ่มกลับไปฟอร์ม
- ปุ่มดูข้อมูล JSON

### การจัดรูปแบบข้อมูล
- แปลง snake_case เป็น Title Case
- จัดรูปแบบวันที่
- จัดรูปแบบรายการ
- จัดรูปแบบช่วงตัวเลข

## 🎨 UI/UX Features

### Material Design
- ใช้ Material Design Components
- สีสันที่สวยงาม
- Animation ที่นุ่มนวล

### Responsive Layout
- รองรับหน้าจอขนาดต่างๆ
- Layout แบบ 2 คอลัมน์
- Scroll view ป้องกัน overflow

### Visual Feedback
- Validation messages
- Loading states
- Success/Error notifications

## 🔍 การ Debug

### Console Logs
```dart
debugPrint('Form submitted: $formData');
```

### Form Validation
- แสดงข้อผิดพลาดใต้ฟิลด์
- ปุ่ม Submit จะไม่ทำงานถ้าข้อมูลไม่ถูกต้อง

## 📁 โครงสร้างไฟล์

```
lib/
├── main.dart                 # จุดเริ่มต้นแอป
├── sources/
│   ├── complete_form.dart    # ฟอร์มครบครัน
│   ├── signup_form.dart      # ฟอร์มสมัครสมาชิก
│   ├── custom_fields.dart    # ฟิลด์พิเศษ
│   ├── conditional_fields.dart # ฟิลด์แบบมีเงื่อนไข
│   ├── dynamic_fields.dart   # ฟิลด์แบบเพิ่ม/ลบได้
│   ├── grouped_radio_checkbox.dart # ตัวเลือกแบบกลุ่ม
│   ├── related_fields.dart   # ฟิลด์ที่เกี่ยวข้องกัน
│   └── form_result_page.dart # หน้าแสดงผล
```


