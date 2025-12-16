import React, { useState } from "react";
import FormInput from "./FormInput";
import "./InputForm.css";

const InputForm = () => {
    const [formData, setFormData] = useState({
        name: "",
        email: "",
        password: "",
        confirmPassword: ""
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const fields = [
        { label: "Name", type: "text", name: "name" },
        { label: "Email", type: "email", name: "email" },
        { label: "Password", type: "password", name: "password" },
        { label: "Confirm Password", type: "password", name: "confirmPassword" }
    ];

    return (
        <>
            <form className="input-form">
                <h2>Input Form</h2>
                {fields.map(field => (
                    <FormInput
                        key={field.name}
                        label={field.label}
                        type={field.type}
                        name={field.name}
                        value={formData[field.name]}
                        onChange={handleChange}
                    />
                ))}
            </form>

            <div className="output">
                <h2>Output</h2>
                {Object.keys(formData).map(key => (
                    <p key={key}><strong>{key.charAt(0).toUpperCase() + key.slice(1)}:</strong> {formData[key]}</p>
                ))}
            </div>
        </>
    );
};

export default InputForm;
