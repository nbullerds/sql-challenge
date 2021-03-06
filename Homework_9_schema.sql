PGDMP         !                y         	   Employees    12.6    12.6     )           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            *           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            +           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ,           1262    16393 	   Employees    DATABASE     �   CREATE DATABASE "Employees" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Employees";
                postgres    false            -           0    0    DATABASE "Employees"    COMMENT     �   COMMENT ON DATABASE "Employees" IS 'Database created for the UMN SQL-Challenge as part of the Data Analysis and Data Visualization Bootcamp';
                   postgres    false    2860            �            1259    16394    Departments    TABLE     x   CREATE TABLE public."Departments" (
    dept_no character(4) NOT NULL,
    dept_name character varying(255) NOT NULL
);
 !   DROP TABLE public."Departments";
       public         heap    postgres    false            �            1259    16412    Dept_Emp    TABLE     c   CREATE TABLE public."Dept_Emp" (
    emp_no integer NOT NULL,
    dept_no character(4) NOT NULL
);
    DROP TABLE public."Dept_Emp";
       public         heap    postgres    false            �            1259    16417    Dept_Manager    TABLE     g   CREATE TABLE public."Dept_Manager" (
    dept_no character(4) NOT NULL,
    emp_no integer NOT NULL
);
 "   DROP TABLE public."Dept_Manager";
       public         heap    postgres    false            �            1259    16399 	   Employees    TABLE     '  CREATE TABLE public."Employees" (
    emp_no integer NOT NULL,
    emp_title character varying(6) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    sex character(1) NOT NULL,
    hire_date date NOT NULL
);
    DROP TABLE public."Employees";
       public         heap    postgres    false            �            1259    16407    Salaries    TABLE     ]   CREATE TABLE public."Salaries" (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);
    DROP TABLE public."Salaries";
       public         heap    postgres    false            �            1259    16422    Titles    TABLE     x   CREATE TABLE public."Titles" (
    title_id character varying(6) NOT NULL,
    title character varying(255) NOT NULL
);
    DROP TABLE public."Titles";
       public         heap    postgres    false            �            1259    16458 	   employees    VIEW     D  CREATE VIEW public.employees AS
 SELECT e.emp_no,
    t.title,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.sex,
    e.hire_date,
    s.salary
   FROM ((public."Employees" e
     JOIN public."Titles" t ON (((e.emp_title)::text = (t.title_id)::text)))
     JOIN public."Salaries" s ON ((e.emp_no = s.emp_no)));
    DROP VIEW public.employees;
       public          postgres    false    204    203    203    203    203    203    203    203    207    207    204            �
           2606    16398    Departments pk_Departments 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "pk_Departments" PRIMARY KEY (dept_no);
 H   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "pk_Departments";
       public            postgres    false    202            �
           2606    16416    Dept_Emp pk_Dept_Emp 
   CONSTRAINT     c   ALTER TABLE ONLY public."Dept_Emp"
    ADD CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (emp_no, dept_no);
 B   ALTER TABLE ONLY public."Dept_Emp" DROP CONSTRAINT "pk_Dept_Emp";
       public            postgres    false    205    205            �
           2606    16421    Dept_Manager pk_Dept_Manager 
   CONSTRAINT     b   ALTER TABLE ONLY public."Dept_Manager"
    ADD CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (emp_no);
 J   ALTER TABLE ONLY public."Dept_Manager" DROP CONSTRAINT "pk_Dept_Manager";
       public            postgres    false    206            �
           2606    16406    Employees pk_Employees 
   CONSTRAINT     \   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "pk_Employees" PRIMARY KEY (emp_no);
 D   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "pk_Employees";
       public            postgres    false    203            �
           2606    16411    Salaries pk_Salaries 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Salaries"
    ADD CONSTRAINT "pk_Salaries" PRIMARY KEY (emp_no);
 B   ALTER TABLE ONLY public."Salaries" DROP CONSTRAINT "pk_Salaries";
       public            postgres    false    204            �
           2606    16426    Titles pk_Titles 
   CONSTRAINT     X   ALTER TABLE ONLY public."Titles"
    ADD CONSTRAINT "pk_Titles" PRIMARY KEY (title_id);
 >   ALTER TABLE ONLY public."Titles" DROP CONSTRAINT "pk_Titles";
       public            postgres    false    207            �
           2606    16442    Dept_Emp fk_Dept_Emp_dept_no    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dept_Emp"
    ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY (dept_no) REFERENCES public."Departments"(dept_no);
 J   ALTER TABLE ONLY public."Dept_Emp" DROP CONSTRAINT "fk_Dept_Emp_dept_no";
       public          postgres    false    205    202    2711            �
           2606    16437    Dept_Emp fk_Dept_Emp_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dept_Emp"
    ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY (emp_no) REFERENCES public."Employees"(emp_no);
 I   ALTER TABLE ONLY public."Dept_Emp" DROP CONSTRAINT "fk_Dept_Emp_emp_no";
       public          postgres    false    2713    203    205            �
           2606    16447 $   Dept_Manager fk_Dept_Manager_dept_no    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dept_Manager"
    ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY (dept_no) REFERENCES public."Departments"(dept_no);
 R   ALTER TABLE ONLY public."Dept_Manager" DROP CONSTRAINT "fk_Dept_Manager_dept_no";
       public          postgres    false    2711    202    206            �
           2606    16452 #   Dept_Manager fk_Dept_Manager_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public."Dept_Manager"
    ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY (emp_no) REFERENCES public."Employees"(emp_no);
 Q   ALTER TABLE ONLY public."Dept_Manager" DROP CONSTRAINT "fk_Dept_Manager_emp_no";
       public          postgres    false    206    203    2713            �
           2606    16427     Employees fk_Employees_emp_title    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "fk_Employees_emp_title" FOREIGN KEY (emp_title) REFERENCES public."Titles"(title_id);
 N   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "fk_Employees_emp_title";
       public          postgres    false    203    2721    207            �
           2606    16432    Salaries fk_Salaries_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public."Salaries"
    ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY (emp_no) REFERENCES public."Employees"(emp_no);
 I   ALTER TABLE ONLY public."Salaries" DROP CONSTRAINT "fk_Salaries_emp_no";
       public          postgres    false    204    2713    203           